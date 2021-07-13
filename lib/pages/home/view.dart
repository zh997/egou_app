import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'logic.dart';
import 'state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  final FocusNode _searchFocusNode = FocusNode();
  Future _future;
  int tabIndex = 0;
  int category_id;
  TabController tabController;
  final ImagePicker _picker = ImagePicker();
  QrReaderViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onInitData(true);
  }

  Future openScan(BuildContext context) async {
    if (false == await permission()) {
      return;
    }
    openScanUI(context);
  }

  Future startScan() async {
    assert(_controller != null);
    _controller?.startCamera((String result, _) async {
      Navigator.of(context).pop();
      onRedirect(result);
    });
  }

  Future stopScan() async {
    print(_controller);
    await _controller?.stopCamera();
  }

  Future<bool> permission() async {
    if (_openAction) return false;
    _openAction = true;
    var status = await Permission.camera.status;
    print(status);
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.camera.request();
      print(status);
    }

    if (status.isRestricted) {
      Utils.toast('请必须授权照相机权限');
      await Future.delayed(Duration(seconds: 3));
      openAppSettings();
      _openAction = false;
      return false;
    }

    if (!status.isGranted) {
      Utils.toast('请必须授权照相机权限');
      _openAction = false;
      return false;
    }
    _openAction = false;
    return true;
  }

  bool _openAction = false;

  void openScanUI(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.COLOR_PRIMARY_D22315,
          title: Text('扫码'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 320,
                height: 350,
                child: QrReaderView(
                  width: 320,
                  height: 350,
                  callback: (container) {
                    this._controller = container;
                    this.startScan();
                  },
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: imgScan,
                child: Text(
                  '选择图片',
                  style: TextStyle(
                      color: AppColors.COLOR_PRIMARY_D22315,
                      fontSize: AppFontsize.SIZE_48,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
    }));
  }

  Future imgScan() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) return;
    final rest = await FlutterQrReader.imgScan(image.path);
    print(rest);
    onRedirect(rest);
  }

  Future onRedirect(String cameraScanResult) async {
    String queryStr = cameraScanResult.split('?')[1];
    if (queryStr.indexOf('shop_id') != -1) {
      Get.toNamed(RouteConfig.discount_pay + '?$queryStr');
    }
    if (queryStr.indexOf('invitation') != -1) {
      Get.toNamed(RouteConfig.register_page + '?$queryStr');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            tabController =
                TabController(length: state.Category.value.length, vsync: this);
            tabController.animateTo(tabIndex);
            tabController.addListener(() {
              if (category_id != state.Category.value[tabController.index].id) {
                category_id = state.Category.value[tabController.index].id;
                tabIndex = tabController.index;
                logic.onCategoryData(category_id);
              }
            });
            return Obx(() {
              return Scaffold(
                  backgroundColor: AppColors.COLOR_GRAY_F8F8F8,
                  body: Column(
                    children: [
                      _HeaderSearch(),
                      Expanded(
                          child: TabBarView(
                        controller: tabController,
                        children: List.generate(
                            state.Category.value.length,
                            (index) => EasyRefresh.custom(
                                  header: BallPulseHeader(
                                      color: AppColors.COLOR_PRIMARY_D22315),
                                  footer: BallPulseFooter(
                                      color: AppColors.COLOR_PRIMARY_D22315),
                                  onRefresh: () async =>
                                      await logic.onCategoryData(category_id),
                                  onLoad: () async =>
                                      await logic.onLoadMore(category_id),
                                  slivers: <Widget>[
                                    SliverList(
                                      delegate: SliverChildListDelegate([
                                        Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setWidth(44)),
                                          child: Column(
                                            children: [
                                              state.BannerList.value.length > 0
                                                  ? _Swiper()
                                                  : SizedBox(),
                                              _GridItems()
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: ScreenUtil().setWidth(56)),
                                        _title(),
                                        SizedBox(height: 20)
                                      ]),
                                    ),
                                    SliverGrid(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio:
                                            ScreenUtil().setWidth(492) /
                                                ScreenUtil().setWidth(680),
                                      ),
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          if (index % 2 > 0) {
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    right: AppSpace.SPACE_52),
                                                child: GoodsItem(
                                                    item: state.goodsList
                                                        .value[index]));
                                          } else {
                                            return Padding(
                                                padding: EdgeInsets.only(
                                                    left: AppSpace.SPACE_52),
                                                child: GoodsItem(
                                                    item: state.goodsList
                                                        .value[index]));
                                          }
                                        },
                                        childCount:
                                            state.goodsList.value.length,
                                      ),
                                    ),
                                    SliverList(
                                        delegate: SliverChildListDelegate(
                                            [SizedBox(height: 20)]))
                                  ],
                                )),
                      )),
                    ],
                  ));
            });
          }

          return SpinKit();
        });
  }

  Widget _HeaderSearch() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          color: AppColors.COLOR_PRIMARY_D22315,
          border: Border(
              bottom:
                  BorderSide(width: 1, color: AppColors.COLOR_GRAY_F7F7F7))),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(
                  left: AppSpace.SPACE_52, right: AppSpace.SPACE_52),
              height: ScreenUtil().setHeight(171),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      child: Search('搜索商品', readOnly: true, onTap: () {
                    Get.toNamed(RouteConfig.search_page);
                  }, focusNode: _searchFocusNode)),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => openScan(context),
                    child: Container(
                        alignment: Alignment.centerRight,
                        width: ScreenUtil().setSp(180),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.SCAN_ICON,
                              width: ScreenUtil().setWidth(56),
                              height: ScreenUtil().setWidth(56),
                              color: Colors.white,
                            ),
                            Text(AppStrings.SCAN,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(42),
                                    color: Colors.white))
                          ],
                        )),
                  )
                ],
              )),
          TabBarWidget(
            state.Category.value,
            tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _Swiper() {
    return Container(
      // width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setWidth(531),
      child: Swiper(
          key: UniqueKey(),
          index: 0,
          duration: 1000,
          onIndexChanged: logic.onSwiperChange,
          itemCount: state.BannerList.value.length,
          autoplay: true,
          pagination: SwiperPagination(builder: SwiperCustomPagination(builder:
              (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
            Color _activeCircleBg(int index) {
              if (swiperPluginConfig.activeIndex == index) {
                return AppColors.COLOR_PRIMARY_D22315;
              } else {
                return Colors.white;
              }
            }

            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    state.BannerList.value.length,
                    (index) => Container(
                          margin: EdgeInsets.only(left: 2.5, right: 2.5),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: _activeCircleBg(index)),
                        )));
          })),
          itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.only(
                    left: AppSpace.SPACE_52, right: AppSpace.SPACE_52),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(20)))),
                clipBehavior: Clip.hardEdge,
                child: Image.network(state.BannerList.value[index].image,
                    fit: BoxFit.fill),
              )),
    );
  }

  Widget _GridItems() {
    return Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(44)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.be_guest);
              },
              child: Column(
                children: [
                  Image.asset(AppImages.ICON_24,
                      width: ScreenUtil().setWidth(151),
                      height: ScreenUtil().setWidth(151)),
                  SizedBox(height: ScreenUtil().setWidth(29)),
                  Text(AppStrings.STRING_1,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(44),
                          color: AppColors.COLOR_BLACK_000000))
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(
                    RouteConfig.points_mall + '?type=${MallType.scene_mall}');
              },
              child: Column(
                children: [
                  Image.asset(AppImages.ICON_2,
                      width: ScreenUtil().setWidth(151),
                      height: ScreenUtil().setWidth(151)),
                  SizedBox(height: ScreenUtil().setWidth(29)),
                  Text(AppStrings.STRING_2,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(44),
                          color: AppColors.COLOR_BLACK_000000))
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.points_mall +
                    '?type=${MallType.community_mall}');
              },
              child: Column(
                children: [
                  Image.asset(AppImages.ICON_3,
                      width: ScreenUtil().setWidth(151),
                      height: ScreenUtil().setWidth(151)),
                  SizedBox(height: ScreenUtil().setWidth(29)),
                  Text(AppStrings.STRING_3,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(44),
                          color: AppColors.COLOR_BLACK_000000))
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.shop_page);
              },
              child: Column(
                children: [
                  Image.asset(AppImages.ICON_4,
                      width: ScreenUtil().setWidth(151),
                      height: ScreenUtil().setWidth(151)),
                  SizedBox(height: ScreenUtil().setWidth(29)),
                  Text(AppStrings.STRING_4,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(44),
                          color: AppColors.COLOR_BLACK_000000))
                ],
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: ScreenUtil().setWidth(234),
            color: AppColors.COLOR_GRAY_D2D2D2,
            height: 1),
        Padding(
            padding: EdgeInsets.only(
                left: AppSpace.SPACE_52, right: AppSpace.SPACE_52),
            child: Text(AppStrings.STRING_5,
                style: TextStyle(
                    color: AppColors.COLOR_BLACK_333333,
                    fontSize: ScreenUtil().setSp(48),
                    fontWeight: FontWeight.bold))),
        Container(
            width: ScreenUtil().setWidth(234),
            color: AppColors.COLOR_GRAY_D2D2D2,
            height: 1),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/pages/confirm_order/logic.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:egou_app/models/address.dart';
import 'package:get/get.dart';

import 'package:egou_app/middleware/app_middleware.dart';
import 'logic.dart';
import 'state.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage>  with RouteAware {
  final AddressLogic logic = Get.put(AddressLogic());
  final MainLogic mainLogic  = Get.put(MainLogic());
  final MainState mainState  = Get.find<MainLogic>().state;
  final AddressState state = Get.find<AddressLogic>().state;
  String isSelect = Get.parameters['isSelect'];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() async {
    mainLogic.onGetAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mainLogic.onGetAddressList(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Scaffold(
                appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '地址管理'),
                body: Obx(() => Column(
                    children: [
                      mainState.addressList.value.length == 0 ? Empty(text: '暂时还没有地址哦，快去添加吧~', btnText: '添加收货地址', onTap: (){
                        Get.toNamed(RouteConfig.edit_address);
                      },) : SizedBox(),
                      mainState.addressList.value.length > 0 ? Expanded(
                          child: ListView(
                              children: List.generate(mainState.addressList.value.length, (index) => _CurrentSelectedAddress(mainState.addressList.value[index]))
                          )) : SizedBox(),
                      mainState.addressList.value.length > 0 ? Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setWidth(250),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                        ),
                        child: RadiusButton('添加收货地址', height: 156, onTap: (){Get.toNamed(RouteConfig.edit_address);}),
                      ): SizedBox()
                    ]
                ))
            );
          }
          return SpinKit();
        });
  }


  Widget _CurrentSelectedAddress(AddressListModel item) {
    return InkWell(
        onTap: () {
          if (isSelect == null) {
            Get.toNamed(RouteConfig.edit_address + '?id=${item.id}');
          } else {
            mainLogic.onSelectAddress(item);
            Get.back(result:  item.id);
          }
        },
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(7.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(item.contact, style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(item.telephone, style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                        ),
                        item.isDefault == 1 ? Container(
                          width: ScreenUtil().setWidth(137),
                          height: ScreenUtil().setWidth(79),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.COLOR_PRIMARY_FFF2F1,
                              borderRadius: BorderRadius.circular(AppRadius.RADIUS_11),
                              border: Border.all(width: 1, color: AppColors.COLOR_PRIMARY_FFF2F1)
                          ),
                          child: Text('默认', style: TextStyle(
                            color: AppColors.COLOR_PRIMARY_D22315,
                            fontSize: AppFontsize.SIZE_36,
                          ),),
                        ): SizedBox()
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(item.province + item.city + item.district + item.address, style: TextStyle(
                        color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36
                    ), maxLines: 1, overflow: TextOverflow.ellipsis,)
                  ],
                ),
                isSelect == null ? Image.asset(AppImages.ARROW_RIGHT_ICON, width: ScreenUtil().setWidth(23), height: ScreenUtil().setWidth(52)) : SizedBox()
              ],
            )
        )
    );
  }
}

import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchLogic logic = Get.put(SearchLogic());
  final SearchState state = Get.find<SearchLogic>().state;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String keyname = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              _HeaderSearch(context),
              Obx(() {
                final List searchGoodsList = state.searchGoodsList.value;
                return Expanded(child: EasyRefresh.custom(
                  header: BallPulseHeader(color: AppColors.COLOR_PRIMARY_D22315),
                  footer: BallPulseFooter(color: AppColors.COLOR_PRIMARY_D22315),
                  onLoad: () async => await logic.onLoadMore(keyname),
                  slivers: <Widget>[
                    SliverToBoxAdapter(child: SizedBox(height: 20),),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio:   ScreenUtil().setWidth(492) / ScreenUtil().setWidth(680),
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if(index % 2 > 0) {
                            return Padding(
                                padding: EdgeInsets.only(right: AppSpace.SPACE_52),
                                child: GoodsItem(item: searchGoodsList[index])
                            );
                          } else {
                            return Padding(
                                padding: EdgeInsets.only(left: AppSpace.SPACE_52),
                                child: GoodsItem(item: searchGoodsList[index])
                            );
                          }

                        },
                        childCount: state.searchGoodsList.value.length,
                      ),
                    ),
                    SliverList(delegate: SliverChildListDelegate([
                      SizedBox(height: 20)
                    ]))
                  ],
                ));
              })
            ],
          )
      ),
    );
  }


  Widget _HeaderSearch(context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5,left: AppSpace.SPACE_52,right: AppSpace.SPACE_52), color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap:(){
              FocusScope.of(context).unfocus();
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_outlined, size: 20,),
          ),
          Expanded(child: Search('请输入商品名称搜索', controller: _searchController, focusNode: _searchFocusNode, autofocus: true,
            onSubmitted: (String value){
              keyname = value;
              logic.onBaseGoodsList(value);
            },
          ))
        ],
      )
    );
  }
}


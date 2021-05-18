import 'package:egou_app/constant/app_refresh.dart';
import 'package:egou_app/constant/app_space.dart';
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
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_outlined),
                    ),
                    Expanded(child: Search('请输入商品名称搜索', controller: _searchController, focusNode: _searchFocusNode, autofocus: true,
                      onSubmitted: (String value){
                        keyname = value;
                        logic.onBaseGoodsList(value);
                      },
                    ))
                  ],
                ),
              ),
              Obx(() {
                final List searchGoodsList = state.searchGoodsList.value;
                return Expanded(child: EasyRefresh.custom(
                  header: AppRefresh.getHeader(GlobalKey()),
                  footer: AppRefresh.getFooter(GlobalKey()),
                  onLoad: () async => await logic.onLoadMore(keyname),
                  slivers: <Widget>[
                    SliverToBoxAdapter(child: SizedBox(height: 20),),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio:   ScreenUtil().setWidth(492) / ScreenUtil().setWidth(660),
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
}


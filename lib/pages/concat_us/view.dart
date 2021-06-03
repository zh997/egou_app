import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/models/concat_us.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ConcatUsPage extends StatefulWidget {
  @override
  _ConcatUsPageState createState() => _ConcatUsPageState();
}

class _ConcatUsPageState extends State<ConcatUsPage> {
  final ConcatUsLogic logic = Get.put(ConcatUsLogic());
  final ConcatUsState state = Get.find<ConcatUsLogic>().state;
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onShopSettingAbout();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future,builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '联系我们'),
          body: Obx((){
            final ConcatUsModel concatUs = state.concatUs.value;
            return Container(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      _listItem('电话', concatUs.phone.toString()),
                      Divider(color: AppColors.COLOR_GRAY_F7F7F7, height: 1,),
                      _listItem('邮箱', concatUs.mailbox),
                      Divider(color: AppColors.COLOR_GRAY_F7F7F7, height: 1,),
                      _ColumnListItem('地址', concatUs.address),
                      Divider(color: AppColors.COLOR_GRAY_F7F7F7, height: 1,),
                    ]
                )
            );
          }),
        );
      }
      return SpinKit();
    });
  }


  Widget _listItem(text, value) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
              Text(value, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
            ]
        )
    );
  }

  Widget _ColumnListItem(text, value) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
              SizedBox(height: 15),
              Text(value, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
            ]
        )
    );
  }
}

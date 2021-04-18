import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ConcatUsPage extends StatelessWidget {
  final ConcatUsLogic logic = Get.put(ConcatUsLogic());
  final ConcatUsState state = Get.find<ConcatUsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '联系我们'),
      body: Container(
          color: Colors.white,
          child: Column(
              children: [
                SizedBox(height: 15),
                _listItem('电话', '0576-88888888'),
                _listItem('邮箱', '123456789@qq.com'),
                _ColumnListItem('地址', '深圳市龙华区龙华街道116号3楼深圳市龙华区龙华街道116号3楼')
              ]
          )
      ),
    );
  }


  Widget _listItem(text, value) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppColors.COLOR_GRAY_F7F7F7)),
        color: Colors.white,
      ),
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
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: AppColors.COLOR_GRAY_F7F7F7)),
          color: Colors.white,
        ),
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

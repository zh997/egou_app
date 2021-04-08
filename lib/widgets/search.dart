import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(105),
      decoration: BoxDecoration(
        color: AppColors.COLOR_GRAY_5,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(105))
      ),
      child: Row(
        children: [
          Container(width: 40, child: Image.asset(AppImages.SEARCH_ICON, width: ScreenUtil().setWidth(47), height: ScreenUtil().setWidth(47)),) ,
          Expanded(child: TextField(
            cursorColor: AppColors.COLOR_PRIMARY_1,
            style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_BLACK_2),
            decoration: InputDecoration(
                labelText: '搜索商品',
                labelStyle: TextStyle(fontSize: ScreenUtil().setSp(42), color: AppColors.COLOR_GRAY_4),
                contentPadding: EdgeInsets.only(bottom: 15),
                hasFloatingPlaceholder: false,
                focusColor:  AppColors.COLOR_PRIMARY_1,
                border: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }
}

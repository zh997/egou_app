import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {

  final String labelText;
  final bool readOnly;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function onTap;
  final bool autofocus;
  final Function onSubmitted;

  Search(this.labelText, {Key key, this.controller, this.focusNode, this.readOnly = false, this.onTap, this.autofocus = false, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setWidth(105),
        decoration: BoxDecoration(
            color: AppColors.COLOR_GRAY_F7F7F7,
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(105))
        ),
        child: Row(
          children: [
            Container(width: 40, child: Image.asset(AppImages.SEARCH_ICON, width: ScreenUtil().setWidth(47), height: ScreenUtil().setWidth(47)),) ,
            Expanded(child: TextField(
              controller: controller,
              cursorColor: AppColors.COLOR_PRIMARY_D22315,
              style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_BLACK_333333),
              readOnly: readOnly,
              onTap: onTap,
              onSubmitted: onSubmitted,
              autofocus: autofocus,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(fontSize: ScreenUtil().setSp(42), color: AppColors.COLOR_GRAY_CCCCCC),
                contentPadding: EdgeInsets.only(bottom: 15),
                hasFloatingPlaceholder: false,
                focusColor:  AppColors.COLOR_PRIMARY_D22315,
                border: InputBorder.none,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

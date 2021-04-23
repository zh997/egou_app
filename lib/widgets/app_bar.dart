import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  final String title;
  final Widget leading;
  final List<Widget> actions;
  final Color backgroundColor;
  final Color textColor;

  CustomAppBar({this.title, this.leading, this.actions, this.backgroundColor = Colors.white, this.textColor}): super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: leading ?? Text(''),
      ),
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyle(color: textColor ?? AppColors.COLOR_BLACK_333333,
          fontWeight: FontWeight.bold, fontSize: AppFontsize.SIZE_56),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

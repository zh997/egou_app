import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_app/common/utils.dart';
import 'package:zb_app/constant/app_colors.dart';

class RadiusButton extends StatelessWidget {

  final String buttonText;
  double width;
  double height;
  double radius;
  Color color;
  bool isLine;
  Function onTap;
  RadiusButton(this.buttonText, {this.width = 895, this.height = 115, this.radius = 115, this.color, this.isLine = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // width: ScreenUtil().setWidth(this.width),
        height: ScreenUtil().setWidth(this.height),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: color ?? AppColors.COLOR_PRIMARY_1),
            color: isLine ? Colors.transparent : color ?? AppColors.COLOR_PRIMARY_1,
            borderRadius: BorderRadius.circular(radius)
        ),
        child: Text(buttonText, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: isLine ? AppColors.COLOR_PRIMARY_1 : Colors.white)),
      ),
    );
  }

}

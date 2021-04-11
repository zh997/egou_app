import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class Price extends StatelessWidget {
  final Color color;
  final String price;
  final double size;
  Price({this.color, Key key, this.price, this.size}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 1.8),
            child: Text('￥',  style: TextStyle(fontSize:
            AppFontsize.SIZE_32, color:
            color ?? AppColors.COLOR_PRIMARY_D22315,fontWeight: FontWeight.bold))),
        Text('${price ?? '0.00'}',  style: TextStyle(
            fontSize: size ?? AppFontsize.SIZE_56,
            color: color ?? AppColors.COLOR_PRIMARY_D22315,
            fontWeight: FontWeight.bold
        ))
      ],
    );
  }
}

class Counter extends StatelessWidget{
  final Function leftTap;
  final Function rightTap;
  Counter({Key key, this.leftTap, this.rightTap}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.COLOR_GRAY_EAEAEA)
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: leftTap,
            child: Icon(Icons.remove, size: 15,),
          ),
          Padding(padding: EdgeInsets.only(left: 15, right: 15), child: Text('1', style: TextStyle(color: AppColors.COLOR_BLACK_000000, fontSize: AppFontsize.SIZE_46))),
          GestureDetector(
            onTap: rightTap,
            child: Icon(Icons.add, size: 15,),
          )
        ],
      ),
    );
  }
}

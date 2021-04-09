import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:flutter/cupertino.dart';

class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 1.8), child: Text('￥',  style: TextStyle(fontSize: AppFontsize.SIZE_32, color: AppColors.COLOR_PRIMARY_1))),
        Text('888',  style: TextStyle(fontSize: AppFontsize.SIZE_56, color: AppColors.COLOR_PRIMARY_1, fontWeight: FontWeight.bold))
      ],
    );
  }
}

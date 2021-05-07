import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class UploadBtn extends StatelessWidget {
  final List imgList;
  final int maxImgLength;
  final Function onTap;
  final String titleText;
  final bool isRequired;
  final Function onDelete;

  const UploadBtn({Key key, this.imgList, this.maxImgLength, this.onTap, this.titleText, this.isRequired = false, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 标题
    final title = [
      Text('${titleText ?? ''}', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
      Container(
        width: 8,
        child: Text('${isRequired ? '*' : ''}', style: TextStyle(color: AppColors.COLOR_PRIMARY_FF733E, fontSize: AppFontsize.SIZE_48)),
      ),
    ];
    final uploadBtn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('添加照片', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
          ],
        ),
        Text('最多可上传两张', style: TextStyle(color: AppColors.COLOR_GRAY_CCCCCC, fontSize: AppFontsize.SIZE_42))
      ],
    );

    return Column(
      children: [
        Row(
          children: title,
        ),
        imgList != null && imgList.length > 0 ? Column(
          children: List.generate(imgList.length, (index) => Stack(
            children: [
              Container(
                width: ScreenUtil().setWidth(1044),
                height: ScreenUtil().setWidth(460),
                margin: EdgeInsets.only(top: 15, bottom: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: AppColors.COLOR_GRAY_F6F6F6,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
                ),
                child: Image.asset(imgList[index], fit: BoxFit.cover),
              ),
              Positioned(top: 10, right: 10, child: GestureDetector(
                onTap: () {
                  onDelete(index);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0x7F000000)
                  ),
                  child: Icon(Icons.close, color: Colors.white,),
                ),
              ))
             ],
          ))) : SizedBox(),
        imgList != null && imgList.length < maxImgLength ?
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: ScreenUtil().setWidth(1044),
            height: ScreenUtil().setWidth(460),
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.COLOR_GRAY_F6F6F6,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
            ),
            child: uploadBtn,
          ),
        ) : SizedBox()
      ],
    );
  }
}

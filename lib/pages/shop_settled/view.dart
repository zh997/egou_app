import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ShopSettledPage extends StatelessWidget {
  final ShopSettledLogic logic = Get.put(ShopSettledLogic());
  final ShopSettledState state = Get.find<ShopSettledLogic>().state;

  @override
  Widget build(BuildContext context) {
    final List<Widget> TextFieldItems = [
      RowTextField(title: '商户名称',
          key: GlobalKey(), controller: TextEditingController(),
          isRequired: true, titleFlexType: TitleFlexType.Column,
          height: 150, padding: EdgeInsets.only(left: 15, right: 15),
          labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
          contentPaddingTop: 10, contentPaddingBottom: 10,
          maxLength: 50, minLines: 3, maxLines: 3, labelTop: 6
      ),
      SizedBox(height: 15),
      RowTextField(title: '地址',
        key: GlobalKey(), controller: TextEditingController(),
        isRequired: true, titleFlexType: TitleFlexType.Column,
        height: 150, padding: EdgeInsets.only(left: 15, right: 15),
        labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
        contentPaddingTop: 10, contentPaddingBottom: 10,
        maxLength: 50, minLines: 3, maxLines: 3,labelTop: 6
      ),
      RowTextField(title: '联系方式',
        key: GlobalKey(), controller: TextEditingController(),
        isRequired: true, padding: EdgeInsets.only(left: 15, right: 15),
        labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
        textAlign: TextAlign.end
      ),

      RowTextField(title: '收款方式',
          key: GlobalKey(), controller: TextEditingController(),
          isRequired: true, padding: EdgeInsets.only(left: 15, right: 15),
          labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
          textAlign: TextAlign.end, suffixIcon: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)),
          readOnly: true,
      ),
      SizedBox(height: 15),
      RowTextField(title: '经营内容',
        key: GlobalKey(), controller: TextEditingController(),
        isRequired: true, titleFlexType: TitleFlexType.Column,
        height: 150, padding: EdgeInsets.only(left: 15, right: 15),
        labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
        contentPaddingTop: 10, contentPaddingBottom: 10,
        maxLength: 50, minLines: 3, maxLines: 3,labelTop: 6
      ),

      SizedBox(height: 15),
      RowTextField(title: '门头照片',
        padding: EdgeInsets.only(left: 15, right: 15),
        key: GlobalKey(), controller: TextEditingController(),
        isRequired: true, titleFlexType: TitleFlexType.Column,
        textFieldType: TextFieldType.Upload,
      ),

      SizedBox(height: 15),
      RowTextField(title: '产品或服务照片',
        padding: EdgeInsets.only(left: 15, right: 15),
        key: GlobalKey(), controller: TextEditingController(),
        isRequired: true, titleFlexType: TitleFlexType.Column,
        textFieldType: TextFieldType.Upload,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '商家入驻'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView(
              padding: EdgeInsets.only(),
              children: [
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  color: Colors.white,
                  child: Column(
                    children: TextFieldItems,
                  ),
                )
              ],
            )),
            Container(
              alignment: Alignment.center,
              height: ScreenUtil().setWidth(250),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
              ),
              child:  RadiusButton('立即入驻', width: 903, height: 159),
            )
          ],
        ),
      ),
    );
  }
}

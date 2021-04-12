import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ShopSettledPage extends StatelessWidget {
  final ShopSettledLogic logic = Get.put(ShopSettledLogic());
  final ShopSettledState state = Get.find<ShopSettledLogic>().state;

  @override
  Widget build(BuildContext context) {
    final List<Widget> TextFieldItems = [
      TextFormFieldWidget('shop_name',
        labelText: '请输入',
        padding: EdgeInsets.only(left:15, right: 15),
        minLines: 3,
        maxLines: 3,
        maxLength: 50,
        title: '商户名称',
        isRequired: true,
        contentPaddingTop: 15 ,
        contentTranslateY: -15
      ),
      SizedBox(height: 15),
      TextFormFieldWidget('shop_name',
        labelText: '请输入',
        padding: EdgeInsets.only(left:15, right: 15),
        minLines: 3,
        maxLines: 3,
        maxLength: 50,
        title: '地址',
        isRequired: true,
        contentPaddingTop: 15 ,
        contentTranslateY: -15
      ),
      TextFormFieldWidget('shop_name',
          labelText: '请输入',
          padding: EdgeInsets.only(left:15, right: 15),
          minLines: 1,
          maxLines: 1,
          title: '联系方式',
          isRequired: true,
          derection: DerectionMap.Row,
          labelHeight: 8,
          contentPaddingBottom: 8,
          textAlign: TextAlign.right,
      ),
      TextFormFieldWidget('shop_name',
        labelText: '请选择',
        padding: EdgeInsets.only(left:15, right: 15),
        minLines: 1,
        maxLines: 1,
        title: '收款方式',
        isRequired: true,
        derection: DerectionMap.Row,
        labelHeight: 8,
        contentPaddingBottom: 8,
        textAlign: TextAlign.right,
        rightSolt: Image.asset(AppImages.ARROW_RIGHT_ICON, width: 10, height: 20),
        readOnly: true,
      ),
      TextFormFieldWidget('shop_name',
          labelText: '请输入',
          padding: EdgeInsets.only(left:15, right: 15),
          minLines: 3,
          maxLines: 3,
          title: '经营内容',
          isRequired: true,
          contentPaddingTop: 15 ,
          contentTranslateY: -15
      ),
      SizedBox(height: 15),
      TextFormFieldWidget('shop_name',
          labelText: '请输入',
          padding: EdgeInsets.only(left:15, right: 15),
          title: '门头照片',
          isRequired: true,
          textFieldType: TextFieldType.upload,
      ),
      SizedBox(height: 15),
      TextFormFieldWidget('shop_name',
        labelText: '请输入',
        padding: EdgeInsets.only(left:15, right: 15),
        title: '产品或服务照片',
        isRequired: true,
        textFieldType: TextFieldType.upload,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '商家入驻'),
      body: Column(
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
          ))
        ],
      ),
    );
  }
}

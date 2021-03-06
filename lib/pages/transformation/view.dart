import 'dart:ui';

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TransformationPage extends StatelessWidget {
  final TransformationLogic logic = Get.put(TransformationLogic());
  final TransformationState state = Get.find<TransformationLogic>().state;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _collection_typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> selectOptions = ['余额', '金牛', '金马'];
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '互转',
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.toNamed(RouteConfig.transformation_record_page);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 15),
              child: Text('互转记录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 15,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: RowTextField(title: '选择种类',
                name: 'collection_type',
                key: GlobalKey(), controller: _collection_typeController,
                isRequired: false, padding: EdgeInsets.only(left: 15, right: 15),
                labelText: '请选择', labelAlignment: AlignmentDirectional.centerEnd,
                contentPaddingTop: 9,
                textAlign: TextAlign.end, suffixIcon: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: ScreenUtil().setWidth(30))),
                isCollapsed: true,
                labelBottom: ScreenUtil().setWidth(13),
                showBorder: false,
                readOnly: true,
                onTap: () {

                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: ScreenUtil().setWidth(1159),
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  alignment: Alignment.center,
                                  height: ScreenUtil().setWidth(150),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      Text('收款方式', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_56)),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        behavior: HitTestBehavior.opaque,
                                        child: Icon(Icons.close),
                                      )
                                    ],
                                  )
                              ),
                              Divider(height: 1, color: AppColors.COLOR_GRAY_F5F5F5),
                              Obx(() => Expanded(
                                child: ListView(
                                    children: List.generate(selectOptions.length, (index) => GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        logic.onChangeSelect(index.toString());
                                        _collection_typeController.text = selectOptions[index];
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            state.collection_type.value == index.toString() ?
                                            Image.asset(AppImages.ICON_6, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),) : Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),),
                                            SizedBox(width: 10),
                                            Text(selectOptions[index], style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                                          ],
                                        ),
                                      ),
                                    ))
                                ),
                              ))
                            ],
                          ),
                        );
                      }
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text('当前可用余额', style: TextStyle(color: AppColors.COLOR_GRAY_9E9E9E, fontSize: AppFontsize.SIZE_42),),
                  Text('2434.00', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_42),),
                  Text('元', style: TextStyle(color: AppColors.COLOR_GRAY_9E9E9E, fontSize: AppFontsize.SIZE_42),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_F5F5F5, width: ScreenUtil().setWidth(1)))
              ),
              child:  RowTextField(title: '转账数量',
                name: 'phone',
                key: GlobalKey(), controller: _phoneController,
                isRequired: false, padding: EdgeInsets.only(left: 15, right: 15),
                labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
                textAlign: TextAlign.end,
                showBorder: false,
                isCollapsed: true,
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_F5F5F5, width: ScreenUtil().setWidth(1)))
                ),
                child:  RowTextField(title: '手续费',
                  name: 'phone',
                  key: GlobalKey(), controller: TextEditingController(),
                  isRequired: false, padding: EdgeInsets.only(left: 15, right: 15),
                  labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                  showBorder: false,
                  isCollapsed: true,
                ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_F5F5F5, width: ScreenUtil().setWidth(1)))
                ),
                child:  RowTextField(title: '转账手机号',
                  name: 'phone',
                  key: GlobalKey(), controller: TextEditingController(),
                  isRequired: false, padding: EdgeInsets.only(left: 15, right: 15),
                  labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                  showBorder: false,
                  isCollapsed: true,
                ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_F5F5F5, width: ScreenUtil().setWidth(1)))
                ),
                child:  RowTextField(title: '交易密码',
                  name: 'phone',
                  key: GlobalKey(), controller: TextEditingController(),
                  isRequired: false, padding: EdgeInsets.only(left: 15, right: 15),
                  labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                  showBorder: false,
                  obscureText: true,
                  isCollapsed: true,
                ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('特别说明', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_44)),
                  Text('1.每日可提现一次；', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_44)),
                  Text('2.转账需扣除0%的手续费；', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_44)),
                  Text('3.转账数量必须是1的整数倍；', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_44)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: RadiusButton('确认'),
            )

          ],
        ),
      )
    );
  }
}

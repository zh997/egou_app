import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:egou_app/widgets/app_upload_btn.dart';

import 'package:flutter/material.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:image_picker_web/image_picker_web.dart';

import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart' as getx;
import 'package:image_picker/image_picker.dart';

import 'logic.dart';
import 'state.dart';

class ShopSettledPage extends StatefulWidget {
  @override
  _ShopSettledPageState createState() => _ShopSettledPageState();
}

class _ShopSettledPageState extends State<ShopSettledPage> {
  final ShopSettledLogic logic = getx.Get.put(ShopSettledLogic());
  final ShopSettledState state = getx.Get.find<ShopSettledLogic>().state;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _collection_typeController = TextEditingController();
  final TextEditingController _business_contentController = TextEditingController();

  File _image;
  final ImagePicker _picker = ImagePicker();


  Future getImage(String key) async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery, imageQuality: 1);
    if (pickedFile != null) {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _upLoadImage(_image, key);
      }
    }

    // html.File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    // var formData = html.FormData();
    // formData.appendBlob("file", infos.slice(), infos.name);
    // await logic.uploadImg(formData, key);
  }

  _upLoadImage(File image, String key) async {

    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:name)
    });

    await logic.appUploadImg(formdata, key);

  }


  @override
  Widget build(BuildContext context) {
    return getx.Obx(() {
      final List<String> selectOptions = ['现金', '支付宝', '微信', '银联'];
      _collection_typeController.text = selectOptions[int.parse(state.collection_type.value)];
      final List<Widget> TextFieldItems = [
        RowTextField(title: '商户名称',
            name: 'name',
            key: GlobalKey(), controller: _nameController,
            isRequired: true, titleFlexType: TitleFlexType.Column,
            height: 150, padding: EdgeInsets.only(left: 15, right: 15),
            labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
            contentPaddingTop: 10, contentPaddingBottom: 10,
            maxLength: 50, minLines: 3, maxLines: 3, labelTop: 6
        ),
        SizedBox(height: 15),
        RowTextField(title: '地址',
            name: 'address',
            key: GlobalKey(), controller: _addressController,
            isRequired: true, titleFlexType: TitleFlexType.Column,
            height: 150, padding: EdgeInsets.only(left: 15, right: 15),
            labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
            contentPaddingTop: 10, contentPaddingBottom: 10,
            maxLength: 50, minLines: 3, maxLines: 3,labelTop: 6
        ),
        RowTextField(title: '联系方式',
            name: 'phone',
            key: GlobalKey(), controller: _phoneController,
            isRequired: true, padding: EdgeInsets.only(left: 15, right: 15),
            labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
            textAlign: TextAlign.end
        ),

        RowTextField(title: '收款方式',
          name: 'collection_type',
          key: GlobalKey(), controller: _collection_typeController,
          isRequired: true, padding: EdgeInsets.only(left: 15, right: 15),
          labelText: '请输入', labelAlignment: AlignmentDirectional.centerEnd,
          contentPaddingTop: 9,
          textAlign: TextAlign.end, suffixIcon: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)),
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
                        getx.Obx(() => Expanded(
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
        SizedBox(height: 15),
        RowTextField(title: '经营内容',
            name: 'business_content',
            key: GlobalKey(), controller: _business_contentController,
            isRequired: true, titleFlexType: TitleFlexType.Column,
            height: 150, padding: EdgeInsets.only(left: 15, right: 15),
            labelText: '请输入', labelAlignment: AlignmentDirectional.topStart,
            contentPaddingTop: 10, contentPaddingBottom: 10,
            maxLength: 50, minLines: 3, maxLines: 3,labelTop: 6
        ),
      ];


       return Scaffold(
         appBar: CustomAppBar(title: '商家入驻'),
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
                   ),
                   Container(
                     padding: EdgeInsets.all(15),
                     color: Colors.white,
                     child: Column(
                       children: [
                         UploadBtn(titleText:'门头照片',maxImgLength: 2, imgList: state.shop_photo.value, onTap: (){
                           getImage('shop_photo');
                         }, isRequired: true, onDelete: (index) {
                           logic.removeImg('shop_photo', index);
                         }, ),
                         UploadBtn(titleText:'产品或服务照片',maxImgLength: 2, imgList: state.other_img.value, onTap: (){
                           getImage('other_img');
                         },isRequired: true, onDelete: (index) {
                           logic.removeImg('other_img', index);
                         },)
                       ],
                     ),
                   ),
                   Container(
                     alignment: Alignment.center,
                     height: ScreenUtil().setWidth(250),
                     decoration: BoxDecoration(
                       color: Colors.white,
                     ),
                     child:  RadiusButton('申请入驻', width: 903, height: 159, onTap: (){
                       final data = Utils.getFormValue(TextFieldItems);
                       data['collection_type'] = state.collection_type.value;
                       data['shop_photo'] = state.shop_photo.value.join(',');
                       data['other_img'] = state.other_img.value.join(',');
                       print(data);
                       logic.entryAdd(data);
                     },),
                   )
                 ],
               )),

             ],
           ),
         ),
       );
    });
  }
}

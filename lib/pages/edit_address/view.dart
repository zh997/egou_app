import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:city_picker/city_picker.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class EditAddressPage extends StatefulWidget {
  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage>{
  final EditAddressLogic logic = Get.put(EditAddressLogic());
  final EditAddressState state = Get.find<EditAddressLogic>().state;

  int is_default  = 1;

  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> textFieldItems = [
      RowTextField(
        name: 'contact',
        labelText: '请输入收货人姓名',
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        key: GlobalKey(),
        controller:_contactController,
      ),
      RowTextField(
        name: 'telephone',
        labelText: '请输入联系方式',
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        key: GlobalKey(),
        controller: _telephoneController,
      ),
      RowTextField(
        name: 'city',
        labelText: '请选择省市区',
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        key: GlobalKey(),
        controller: _cityController,
        readOnly: true,
        onTap: () async {
          CityResult result = await showCityPicker(context);
          String province = result?.province; // 省
          String city = result?.city; // 市
          String county = result?.county; // 地级市/县
          await logic.onNameToId({
            'province': result.province,
            'city': result.city,
            'district': result.county
          });
          _cityController.text = province + city + county;
        },
        suffixIcon: Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18),
      ),
      SizedBox(height: 15),
      RowTextField(
        name: 'address',
        labelText: '请输入详细地址',
        titleFlexType: TitleFlexType.Column,
        height: 100,
        maxLines: 3,
        minLines: 3,
        title: '详细地址',
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        labelAlignment: AlignmentDirectional.topStart,
        key: GlobalKey(),
        controller: TextEditingController(),
        labelTop: 10,
      )
    ];
    return Scaffold(
        appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '编辑地址'),
        body: Column(
            children: [
              Expanded(
                  child: ListView(
                      children: [
                        SizedBox(height: 15),
                        Container(
                            color: Colors.white,
                            child: Column(
                                children: textFieldItems
                            )
                        ),
                        SizedBox(height: 15),
                        _listItem('设为默认地址'),
                        SizedBox(height: 15),
                        Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            color: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete_forever, color: AppColors.COLOR_PRIMARY_D22315),
                                  SizedBox(width: 5),
                                  Text('删除该地址', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48))
                                ]
                            )
                        )
                      ]
                  )
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setWidth(250),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                ),
                child: RadiusButton('保存', width: 903, height: 156, onTap: (){Get.offNamed(RouteConfig.address_page);}),
              )
            ]
        )
    );
  }

  Widget _listItem(text, {rightText}) {
    return Container(
      // padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
              Switch(value: true, onChanged: (bool val){
               if (val){
                 is_default = 1;
               } else {
                 is_default = 0;
               }
              })
            ]
        )
    );
  }
}
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/address.dart';
import 'package:egou_app/pages/address/logic.dart';
import 'package:egou_app/pages/address/state.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:egou_app/widgets/small_widget.dart';
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
  final MainLogic mainLogic = Get.put(MainLogic());
  final EditAddressState state = Get.find<EditAddressLogic>().state;
  final MainState mainState = Get.find<MainLogic>().state;
  String id = Get.parameters['id'];
  int is_default  = 1;
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState(){
    super.initState();
    if (id != null) {
      mainState.addressList.value.forEach((element) {
        if (int.parse(id) == element.id) {
          _contactController.text = element.contact;
          _telephoneController.text = element.telephone;
          _cityController.text = element.province + element.city + element.district;
          _addressController.text = element.address;
          logic.onChangeAddressIds(AddressNameToIdModel(
              province: element.provinceId,
              city: element.cityId,
              district: element.districtId
          ));
          setState(() {
            is_default = element.isDefault;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mainLogic.onGetAddressList();
  }

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
        controller: _addressController,
        labelTop: 10,
      )
    ];
    return Scaffold(
        appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '编辑地址'),
        body: ListView(
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
              id != null ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  AppAnimatedDialog.onShowAnimatedDialog(context, '确定删除该地址吗？', () async {
                    await logic.onDelAddress({
                      'id': int.parse(id)
                    });
                    Get.back(result: 'success');
                  });

                },
                child: Container(
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
                ) ,
              ) : SizedBox(),
              SizedBox(height: 15),
              Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: RadiusButton('保存', width: 300, height: 156, onTap: (){
                    final data = Utils.getFormValue(textFieldItems);
                    data.remove('city');
                    data['province_id'] = state.AddressIds.value.province;
                    data['city_id'] = state.AddressIds.value.city;
                    data['district_id'] = state.AddressIds.value.district;
                    data['is_default'] = is_default;
                    if(id != null) {
                      data['id'] = int.parse(id);
                      logic.onUpdateAddress(data);
                    } else {
                      logic.onAddAddress(data);
                    }
                  })
              )
            ]
        )
    );
  }

  Widget _listItem(text, {rightText}) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
              Switch(value: is_default == 1, onChanged: (bool val){
                setState(() {
                  if (val){
                    is_default = 1;
                  } else {
                    is_default = 0;
                  }
                });
              })
            ]
        )
    );
  }
}

import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/pages/bank_card_list/state.dart';
import 'package:egou_app/pages/bank_card_list/logic.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egou_app/models/bank_card_list.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:get/get.dart' as getx;

import 'logic.dart';
import 'state.dart';



class MakeQrcodePage extends StatefulWidget {
  @override
  _MakeQrcodePageState createState() => _MakeQrcodePageState();
}

class _MakeQrcodePageState extends State<MakeQrcodePage> {
  final MakeQrcodeLogic logic = getx.Get.put(MakeQrcodeLogic());
  final MakeQrcodeState state = getx.Get.find<MakeQrcodeLogic>().state;
  final BankCardListLogic bankCardListLogic = getx.Get.put(BankCardListLogic());
  final BankCardListState bankCardListState = getx.Get.find<BankCardListLogic>().state;
  final TextEditingController __card_number_controller = TextEditingController();
  String type = getx.Get.parameters['type'];

  File _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final BankCardListModel selectedBankCard = bankCardListState.selectedBankCard.value;
    __card_number_controller.text = selectedBankCard.cardNumber;
    logic.onChangeImage(selectedBankCard.image);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bankCardListLogic.onGetBankCardList();
    super.dispose();
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery, imageQuality: 1);
    if (pickedFile != null) {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _upLoadImage(_image);
        }
    }
    // html.File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    // var formData = html.FormData();
    // formData.appendBlob("file", infos.slice(), infos.name);
    // await logic.uploadImg(formData);
  }

  _upLoadImage(File image) async {

    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:name)
    });

    await logic.appUploadImg(formdata);

  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    if (int.parse(type) == CardListType.wachat) {
      title = '微信';
    }
    if (int.parse(type) == CardListType.ali) {
      title = '支付宝';
    }
    final BankCardListModel selectedBankCard = bankCardListState.selectedBankCard.value;
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '绑定${title}收款码',
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${title}帐号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                RowTextField(
                  key: GlobalKey(),
                  controller: __card_number_controller,
                  labelText: '请输入${title}帐号',
                  showBorder: false,
                ),
                SizedBox(height: 30,),
                Divider(color: AppColors.COLOR_GRAY_F4F4F4, height: 1,),
                SizedBox(height: 30,),
                Text('微信收款码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 30,),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    await getImage();
                  },
                  child: getx.Obx(() {
                    final String image = state.image.value;
                    return Container(
                      width: ScreenUtil().setWidth(307),
                      height:  ScreenUtil().setWidth(307),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          image != null ?Image.network(image,  fit:BoxFit.cover) : Image.asset(AppImages.CARD_QRCODE,  fit:BoxFit.cover),
                          Container(color: Color(0x7F000000),width: ScreenUtil().setWidth(307),
                            height:  ScreenUtil().setWidth(307),),
                          Image.asset(AppImages.CAMARA_ICON,  width: 60, height:60,),
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.all(20), child: RadiusButton('保存', width: 700,onTap: (){
            final Map<String, dynamic> data = {};
            data['card_number'] = __card_number_controller.text;
            data['type'] = int.parse(type);
            data['image'] = state.image.value;
            if(selectedBankCard.id != null){
              data['id'] = selectedBankCard.id;
            }
            logic.onAddBankCard(data);
          },))
        ],
      ),
    );
  }
}
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/models/bank_card_list.dart';
import 'package:egou_app/pages/bank_card_list/logic.dart';
import 'package:egou_app/pages/bank_card_list/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BindCardPage extends StatefulWidget {
  @override
  _BindCardPageState createState() => _BindCardPageState();
}

class _BindCardPageState extends State<BindCardPage> {
  final BindCardLogic logic = Get.put(BindCardLogic());
  final BindCardState state = Get.find<BindCardLogic>().state;
  final BankCardListLogic bankCardListLogic = Get.put(BankCardListLogic());
  final BankCardListState bankCardListState = Get.find<BankCardListLogic>().state;
  final TextEditingController _card_number_controller = TextEditingController();
  final TextEditingController _phone_controller = TextEditingController();
  final TextEditingController _back_card_type_controller = TextEditingController();
  final TextEditingController _card_holder_controller = TextEditingController();
  int back_type = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final BankCardListModel selectedBankCard = bankCardListState.selectedBankCard.value;
    _card_number_controller.text = selectedBankCard.cardNumber;
    _phone_controller.text = selectedBankCard.phone;
    _back_card_type_controller.text = selectedBankCard.backCardType;
    _card_holder_controller.text = selectedBankCard.cardHolder;
    back_type = selectedBankCard.backType;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bankCardListLogic.onGetBankCardList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BankCardListModel selectedBankCard = bankCardListState.selectedBankCard.value;
    return Scaffold(
        appBar: CustomAppBar(
          leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
          title: '绑定银行卡',
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.withdrawal_record);
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 15),
                  child: Text('提现记录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                ),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            // Text('添加银行卡，继续提现', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
            _stepTwo(),
            SizedBox(height: 50),
            RadiusButton('确认绑定', width: 1080, height: 186, onTap: (){
              if (_card_number_controller.text.isEmpty) {
                return Utils.toast('请输入银行卡号');
              }
              if (_phone_controller.text.isEmpty) {
                return Utils.toast('请输入银行预留手机号');
              }
              if (_back_card_type_controller.text.isEmpty) {
                return Utils.toast('请输入开户银行');
              }
              if (_card_holder_controller.text.isEmpty) {
                return Utils.toast('请输入卡持有人&打款名称');
              }
              final Map<String, dynamic> data = {};
              data['card_number'] = _card_number_controller.text;
              data['back_card_type'] = _back_card_type_controller.text;
              data['phone'] = _phone_controller.text;
              data['card_holder'] = _card_holder_controller.text;
              data['type'] = CardListType.bank;
              data['back_type'] = CardListType.bank;
              if(selectedBankCard.id != null){
                data['id'] = selectedBankCard.id;
              }
              logic.onAddBankCard(data);
            },)
          ],
        )
    );
  }


  Widget _TextFieldFormItem(String labelText, TextEditingController controller) {
    return  Container(
      height: ScreenUtil().setWidth(186),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_20),
          color: AppColors.COLOR_GRAY_EFEFEF
      ),
      child: RowTextField(
        key: GlobalKey(),
        controller: controller,
        labelText: labelText,
        contentPaddingTop: 15,
        contentPaddingLeft: 30,
        contentPaddingRight: 30,
        labelLeft: 30,
        labelTop: 21,
        height: 80,
        showBorder: false,
      ),
    );
  }

  Widget _stepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('银行卡号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        _TextFieldFormItem('点击输入银行卡号', _card_number_controller),
        SizedBox(height: 20),
        Text('银行预留手机号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        _TextFieldFormItem('点击输入银行预留手机号', _phone_controller),
        SizedBox(height: 20),
        Text('开户银行', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        _TextFieldFormItem('点击输入开户银行', _back_card_type_controller),
        SizedBox(height: 20),
        Text('卡持有人&打款名称', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        _TextFieldFormItem('点击卡持有人&打款名称', _card_holder_controller),
        SizedBox(height: 20),
        Text('银行卡类型', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        Column(
          children: List.generate(BankCardTypeList.length, (index) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              setState(() {
                back_type = BankCardTypeList[index].type;
              });
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  back_type == BankCardTypeList[index].type ?
                  Image.asset(AppImages.ICON_6, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),) : Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),),
                  SizedBox(width: 10),
                  Text( BankCardTypeList[index].text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                ],
              ),
            ),
          )),
        )
      ],
    );
  }
}

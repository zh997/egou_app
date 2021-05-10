import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class StepListModel {
  final int status;
  final String text;

  StepListModel({Key key, this.status, this.text});

}

class OrderDetailPage extends StatelessWidget {
  final OrderDetailLogic logic = Get.put(OrderDetailLogic());
  final OrderDetailState state = Get.find<OrderDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '订单详情'),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
                 Container(
                   color: AppColors.COLOR_PRIMARY_D22315,
                   alignment: Alignment.center,
                   height: ScreenUtil().setWidth(398),
                   child: Step(),
                 ),
                 SizedBox(height: 15,),
                 Container(
                   color: Colors.white,
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.all(15),
                         child: Row(
                           children: [
                             Text('退款金额', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                             SizedBox(width: 50,),
                             Price(color: AppColors.COLOR_BLACK_333333,)
                           ],
                         ),
                       ),
                       Divider(height: 1, color: AppColors.COLOR_GRAY_F5F5F5),
                       Padding(
                         padding: EdgeInsets.all(15),
                         child: Row(
                           children: [
                             Text('退款金额', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                             SizedBox(width: 50,),
                             Row(
                               children: [
                                 StepColumn()
                               ],
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                 )
            ],
          )),
          Container(child: Text('按钮'),)
        ],
      ),
    );
  }

  Widget OrderStatus() {
    return Row(
      children: [

      ],
    );
  }


  Widget Step() {
    String statusText = '退款成功';
    int status = 1;
    List<StepListModel> list = [StepListModel(status: 1, text: '提交申请'), StepListModel(status:2, text: '商家审核'), StepListModel(status: 3, text: '商家同意退款')];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(statusText, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_64)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(list.length, (index) => Column(
            children: [
              Row(
                children: [
                  index != 0 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: Colors.white,) : SizedBox(width: ScreenUtil().setWidth(130)),
                  status != list[index].status ? Container(
                    width: ScreenUtil().setWidth(31),
                    height: ScreenUtil().setWidth(31),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(31))
                    ),
                  ) : Image.asset(AppImages.STEP_SUCCESS, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),),
                  index != list.length - 1 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: Colors.white,) : SizedBox(width: ScreenUtil().setWidth(130))
                ],
              ),
              SizedBox(height: 10,),
              Text(list[index].text, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_44))
            ],
          )),
        )
      ],
    );
  }


  Widget StepColumn() {
    String statusText = '退款成功';
    int status = 1;
    List<StepListModel> list = [StepListModel(status: 1, text: '提交申请'), StepListModel(status:2, text: '商家审核'), StepListModel(status: 3, text: '商家同意退款')];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(list.length, (index) => Row(
        children: [
          Column(
            children: [
              index != 0 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(width: ScreenUtil().setWidth(130)),
              status != list[index].status ? Container(
                width: ScreenUtil().setWidth(31),
                height: ScreenUtil().setWidth(31),
                decoration: BoxDecoration(
                    color: AppColors.COLOR_PRIMARY_D22315,
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(31))
                ),
              ) : Image.asset(AppImages.STEP_SUCCESS, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),),
              index != list.length - 1 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(width: ScreenUtil().setWidth(130))
            ],
          ),
          SizedBox(height: 10,),
          Text(list[index].text, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_44))
        ],
      )),
    );
  }
}

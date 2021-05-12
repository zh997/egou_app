import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_order_item.dart';
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
                         padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                         padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('到账进度', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                             SizedBox(width: 50,),
                             Expanded(child:   StepColumn())
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 15,),
                 Container(
                   color: Colors.white,
                   padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                   child: Column(
                     children: [
                       OrderItem(img: AppImages.GOODS_IMG_1, name: 'dasd', price: '0.00', specValueStr: '默认',),
                       SizedBox(height: 15,),
                       Divider(height: 1, color: AppColors.COLOR_GRAY_D2D2D2),
                       SizedBox(height: 15,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('合计退款', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48, fontWeight: FontWeight.bold)),
                           Price(price: '999.00', color: AppColors.COLOR_BLACK_333333)
                         ],
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: 15,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('合计退款', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                          SizedBox(width: 50,),
                          Text('退货退款', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('合计退款', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                          SizedBox(width: 50,),
                          Text('退货退款', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
              SizedBox(height: 15,),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('订单编号', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                        SizedBox(width: 50,),
                        Expanded(child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Text('26598893466580', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                            Text('复制', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('申请时间', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                        SizedBox(width: 50,),
                        Text('2021-04-03', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ],
          )),
          Container(color: Colors.white, padding: EdgeInsets.fromLTRB(15, 10, 15, 10), child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               RadiusButton('查看物流', width: 300, height: 100,),
               SizedBox(width: 15,),
               RadiusButton('确认收货', width: 300, height: 100,)
             ],
          ))
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(list.length, (index) {
        CrossAxisAlignment crossAlignment = CrossAxisAlignment.center;
        if (index == 0) {
          crossAlignment = CrossAxisAlignment.start;
        } else if(index == list.length - 1) {
          crossAlignment = CrossAxisAlignment.end;
        }
        return Row(
          crossAxisAlignment:  crossAlignment,
          children: [
            Column(
              children: [
                index != 0 ? Container(height: ScreenUtil().setWidth(35), width: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(height: 5,),
                Container(
                  width: ScreenUtil().setWidth(25),
                  height: ScreenUtil().setWidth(25),
                  decoration: BoxDecoration(
                      color: AppColors.COLOR_PRIMARY_D22315,
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25))
                  ),
                ),
                index != list.length - 1 ? Container(height: ScreenUtil().setWidth(35), width: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(height: 5,)
              ],
            ),
            SizedBox(width: 10,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(list[index].text, style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                Text(list[index].text, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46))
              ],
            ))
          ],
        );
      }),
    );
  }
}

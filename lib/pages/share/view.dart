import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'logic.dart';
import 'state.dart';

class SharePage extends StatelessWidget {
  final ShareLogic logic = Get.put(ShareLogic());
  final ShareState state = Get.find<ShareLogic>().state;

  _save() async {
    var response = await Dio().get(state.url.value,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "qrcode");
    Utils.toast('已保存到相册');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onGeSharePosterUrl(),builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
            appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '邀请好友'),
            body: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                          color: Colors.blue,
                          child: Image.asset(AppImages.SHARE_BG, fit: BoxFit.fill, width: 10000)
                      ),
                      Positioned(
                          top: ScreenUtil().setWidth(1040),
                          left: 0,
                          child: Container(
                            width: ScreenUtil().setWidth(1125),
                            alignment: Alignment.center,
                            child:  Text('邀请好友得返现', style: TextStyle(
                                color: AppColors.COLOR_AC5A04, fontSize: AppFontsize.SIZE_80,
                                fontWeight: FontWeight.bold
                            )),
                          )
                      ),
                      Positioned(
                          top: ScreenUtil().setWidth(1350),
                          left: 0,
                          child: Container(
                            width: ScreenUtil().setWidth(1125),
                            alignment: Alignment.center,
                            child:  Obx(() => Image.network(state.url.value,
                                width: ScreenUtil().setWidth(400),
                                height: ScreenUtil().setWidth(400),
                                errorBuilder: (BuildContext context, Object object, StackTrace stackTrace) {
                                  return SizedBox();
                                }
                            ),
                            ),
                          )
                      ),
                      Positioned(
                          top: ScreenUtil().setWidth(2000),
                          left: 0,
                          child: Container(
                            width: ScreenUtil().setWidth(1125),
                            alignment: Alignment.center,
                            child: RadiusButton('保存二维码',onTap: _save,),
                          )
                      )
                    ],
                  ),
                ]
            )
        );
      }
      return SpinKit();
    });
  }
}

import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';
import 'state.dart';

class PayResultWebPage extends StatefulWidget {
  @override
  _PayResultWebPageState createState() => _PayResultWebPageState();
}

class _PayResultWebPageState extends State<PayResultWebPage> {
  final PayResultWebLogic logic = Get.put(PayResultWebLogic());
  final PayResultWebState state = Get.find<PayResultWebLogic>().state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onBackApp() async {
    String url = 'nmmhbstl://com.nmmhbstl.egou';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: ScreenUtil().setWidth(400),
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.PAY_SUCCESS_ICON,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100)),
              SizedBox(height: 10),
              Text('支付成功',
                  style: TextStyle(
                      fontSize: AppFontsize.SIZE_56,
                      color: AppColors.COLOR_BLACK_333333)),
              RadiusButton(
                '返回App',
                onTap: onBackApp,
              )
            ],
          ),
        ),
      ),
    );
  }
}

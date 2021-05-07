import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Utils {

  static Color getColor(String s) {
    String rgbColor = '000000';
    if (s.isNotEmpty) {
      rgbColor = s.substring(1, 7);
    }
    return Color(int.parse(rgbColor, radix: 16) + 0xFF000000);
  }

  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  static bool validate( BuildContext context, List formItems, bool isShowErrorText) {
    bool isPass = true;
    for(var i in formItems) {
      if (!(i is SizedBox)) {
        if (i.validate != null && validate is Function) {
          final String errorText = i.validate(i.controller.text);
          if (errorText.isNotEmpty) {
            // FocusScope.of(context).requestFocus(i.focusNode);
            isShowErrorText && i.key.currentState.setErrorText(errorText);
            isPass = false;
            break;
          } else {
            isShowErrorText && i.key.currentState.setErrorText('');
            isPass = true;
          }
        } else if(i.isRequired && !i.controller.text.isNotEmpty) {
          isShowErrorText && i.key.currentState.setErrorText(i.labelText);
          isPass = false;
        } else if(i.isRequired && i.controller.text.isNotEmpty) {
          isShowErrorText && i.key.currentState.setErrorText('');
          isPass = true;
        }
      }
    }
    return isPass;
  }

  static Map<String, dynamic> getFormValue(List formItems) {
    Map<String, dynamic> formData = new Map();
    for(var i in formItems) {
      if (!(i is SizedBox)) {
        formData[i.name] = i.controller.text;
      }
    }
    return formData;
  }
}

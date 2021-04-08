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

  static bool validate( BuildContext context, List formItems) {
    bool isPass = true;
    for(var i in formItems) {
      final String errorText = i.validate(i.controller.text);
      print(errorText);
      if (errorText.isNotEmpty) {
        FocusScope.of(context).requestFocus(i.focusNode);
        i.key.currentState.setErrorText(errorText);
        break;
      } else {
        i.key.currentState.setErrorText('');
      }
    }
    return isPass;
  }

  static Map<String, dynamic> getFormValue(List formItems) {
    Map<String, dynamic> formData = new Map();
    for(var i in formItems) {
       formData[i.name] = i.controller.text;
    }
    return formData;
  }
}

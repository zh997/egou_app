import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_app/constant/app_colors.dart';
import 'package:zb_app/common/utils.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Key key;
  final String name;
  final Function(String val) validate;
  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String initialValue;
  final TextInputType keyboardType;
  final String suffixIcon;
  final Widget rightSolt;
  final FocusNode focusNode = FocusNode();
  final bool obscureText;
  TextFormFieldWidget(this.name, {this.key, this.validate, this.labelText, this.initialValue, this.keyboardType, this.suffixIcon, this.rightSolt, this.obscureText}): super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  String errorText = '';

  void setErrorText(String text) { setState(() {
    errorText = text;
  });}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border:  Border(bottom: BorderSide(width:  1, color: errorText.isNotEmpty ? AppColors.COLOR_RED_1 : Utils.getColor('#CACACA')))
          ),
          child: Row(
            children: [
              widget.suffixIcon.isNotEmpty ? Image.asset( widget.suffixIcon,  width: ScreenUtil().setWidth(42), height: ScreenUtil().setHeight(47)) : Text(''),
              Expanded(child: TextFormField(
                controller:  widget.controller,
                focusNode:  widget.focusNode,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                cursorColor: AppColors.COLOR_PRIMARY_1,
                style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_PRIMARY_1),
                obscureText:  widget.obscureText ?? false,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 15, right: 10, left: 10),
                    hasFloatingPlaceholder: false,
                    focusColor:  AppColors.COLOR_PRIMARY_1,
                    border: InputBorder.none,
                    labelText:  widget.labelText,
                    labelStyle: TextStyle(fontSize: ScreenUtil().setSp(36), color: Utils.getColor('#CACACA'),  height: ScreenUtil().setHeight(4))
                ),
                keyboardType:  widget.keyboardType ?? TextInputType.text,
              )),
              widget.rightSolt != null &&  widget.rightSolt is Widget ?  widget.rightSolt :  Text('')
            ],
          ),
        ),
        Text(errorText, style: TextStyle(color:  AppColors.COLOR_RED_1, height: errorText.isNotEmpty ? 2 : 0), maxLines: 1)
      ],
    );
  }
}
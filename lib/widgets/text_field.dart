import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egou_app/constant/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Key key;
  final String name;
  final Function(String val) validate;
  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String initialValue;
  final TextInputType keyboardType;
  final Widget leftSolt;
  final Widget rightSolt;
  final FocusNode focusNode = FocusNode();
  final bool obscureText;
  TextFormFieldWidget(this.name, {this.key, this.validate, this.labelText, this.initialValue, this.keyboardType, this.leftSolt, this.rightSolt, this.obscureText}): super(key: key);

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
    final List<Widget> textFieldRowItems = [Expanded(child: TextFormField(
      controller:  widget.controller,
      focusNode:  widget.focusNode,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      cursorColor: AppColors.COLOR_PRIMARY_1,
      style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_BLACK_2),
      obscureText:  widget.obscureText ?? false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 15),
          hasFloatingPlaceholder: false,
          focusColor:  AppColors.COLOR_PRIMARY_1,
          border: InputBorder.none,
          labelText:  widget.labelText,
          labelStyle: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_BLACK_1,  height: ScreenUtil().setHeight(4))
      ),
      keyboardType:  widget.keyboardType ?? TextInputType.text,
    ))];

    if (widget.leftSolt != null &&  widget.leftSolt is Widget) {
      textFieldRowItems.insert(0, Container(padding: EdgeInsets.only(right: 5), width: 50, child: widget.leftSolt));
    }

    if (widget.rightSolt != null &&  widget.rightSolt is Widget) {
      textFieldRowItems.add(Padding(padding: EdgeInsets.only(left: 5), child: widget.rightSolt));
    }

    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
              border:  Border(bottom: BorderSide(width:  1, color: errorText.isNotEmpty ? AppColors.COLOR_PRIMARY_1 : AppColors.COLOR_GRAY_1))
          ),
          child: Row(
            children: textFieldRowItems,
          ),
        ),
        Text(errorText, style: TextStyle(color:  AppColors.COLOR_PRIMARY_1 , height: errorText.isNotEmpty ? 2 : 0), maxLines: 1)
      ],
    );
  }
}
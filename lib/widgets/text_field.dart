import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egou_app/constant/app_colors.dart';

enum DerectionMap {Row, Column}
enum TextFieldType {input, upload}

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
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry padding;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final TextAlign textAlign;
  final String title;
  final int labelHeight;
  final bool isRequired;
  final double contentPaddingTop;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingBottom;
  final double contentTranslateY;
  final DerectionMap derection;
  final Function onTap;
  final bool readOnly;
  final textFieldType;
  TextFormFieldWidget(this.name, {
    this.key,
    this.validate,
    this.labelText,
    this.initialValue,
    this.keyboardType,
    this.leftSolt,
    this.rightSolt,
    this.obscureText = false,
    this.contentPadding,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.minLines = 1,
    this.title = '',
    this.labelHeight = 0,
    this.padding,
    this.isRequired = false,
    this.contentPaddingTop = 0,
    this.contentPaddingLeft = 0,
    this.contentPaddingRight = 0,
    this.contentPaddingBottom = 0,
    this.contentTranslateY = 0,
    this.derection = DerectionMap.Column,
    this.onTap,
    this.readOnly = false,
    this.textFieldType = TextFieldType.input
  }): super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {

  String errorText = '';
  bool isFocus = false;
  String value = '';

  void setErrorText(String text) { setState(() {
    errorText = text;
  });}

  @override
  void initState() {
    // TODO: implement initState
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          isFocus = true;
        });
      } else {
        setState(() {
          isFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Widget StackLabelText = Text(widget.labelText,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(48),
            color: AppColors.COLOR_BLACK_848484,
            height: ScreenUtil().setHeight(widget.labelHeight)
        )
    );

    final List<Widget> StackItems = [
      TextFormField(
        controller:  widget.controller,
        focusNode:  widget.focusNode,
        textInputAction: TextInputAction.next,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        cursorColor: AppColors.COLOR_PRIMARY_D22315,
        style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_BLACK_333333),
        obscureText:  widget.obscureText,
        textAlign: widget.textAlign,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        onChanged: (String val) {setState(() {
          value = val;
        });},
        buildCounter: (BuildContext context, { int currentLength,bool isFocused, int maxLength}) {
          return widget.maxLength != null ? Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(currentLength.toString(), style: TextStyle(color: AppColors.COLOR_PRIMARY_FF733E)),
                Text('/${maxLength.toString()}', style: TextStyle(color: AppColors.COLOR_GRAY_CCCCCC))
              ],
            ),
          ) : Text('', style: TextStyle(height: 0));
        },
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? EdgeInsets.only(
              top: widget.contentPaddingTop,
              left: widget.contentPaddingLeft,
              right: widget.contentPaddingRight,
              bottom: widget.contentPaddingBottom
          ),
          hasFloatingPlaceholder: false,
          focusColor:  AppColors.COLOR_PRIMARY_D22315,
          border: InputBorder.none,
          labelText:  widget.derection == DerectionMap.Row ? '' : widget.labelText,
          labelStyle: TextStyle(
              fontSize: ScreenUtil().setSp(48),
              color: AppColors.COLOR_BLACK_848484,
              height: ScreenUtil().setHeight(widget.labelHeight)
          ),
        ),
        keyboardType:  widget.keyboardType ?? TextInputType.text,
      )
    ];

    if (widget.derection == DerectionMap.Row && !isFocus && !value.isNotEmpty) {
      StackItems.insert(0, StackLabelText);
    }

    final List<Widget> textFieldRowItems = [Expanded(child: Stack(
      alignment: const FractionalOffset(1, 0.3),
      children: StackItems,
    ))];

    final Widget TitleWidget = Container(
        child: Row(
          children: [
            Text(widget.title, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
            widget.isRequired ? Text('*', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315)) : Text('')
          ],
    ));

    if (widget.leftSolt != null &&  widget.leftSolt is Widget) {
      textFieldRowItems.insert(0, Container(padding: EdgeInsets.only(right: 5), width: 50, child: widget.leftSolt));
    }

    if (widget.derection == DerectionMap.Row && widget.title.isNotEmpty) {
      textFieldRowItems.insert(0, Container(padding: EdgeInsets.only(right: 5), child: TitleWidget));
    }

    if (widget.rightSolt != null &&  widget.rightSolt is Widget) {
      textFieldRowItems.add(Padding(padding: EdgeInsets.only(left: 5), child: widget.rightSolt));
    }

    List<Widget> textFieldColumnItems = [
      Transform.translate(offset: Offset(0, widget.contentTranslateY), child: Row(
        children: textFieldRowItems,
      ))
    ];

    if (widget.textFieldType == TextFieldType.upload) {
      textFieldColumnItems = [
        Transform.translate(offset: Offset(0, widget.contentTranslateY), child: _upload())
      ];
    }

    if (widget.title.isNotEmpty &&  widget.title is String && widget.derection != DerectionMap.Row) {
      textFieldColumnItems.insert(0, TitleWidget);
    }

    final List<Widget> TextFormFieldColumn = [
      Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            border:  Border(bottom: BorderSide(
                width:  1,
                color: errorText.isNotEmpty ? AppColors.COLOR_PRIMARY_D22315 : AppColors.COLOR_GRAY_E7E8E8)
            )
        ),
        child: Column(
          children: textFieldColumnItems,
        ),
      )
    ];

    if (errorText.isNotEmpty) {
      TextFormFieldColumn.add(Text(errorText, style: TextStyle(color:  AppColors.COLOR_PRIMARY_D22315 ), maxLines: 1));
    }




    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: TextFormFieldColumn,
    );
  }



  Widget _upload() {
    final uploadBtn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text('添加照片', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
          ],
        ),
        Text('最多可上传两张', style: TextStyle(color: AppColors.COLOR_GRAY_CCCCCC, fontSize: AppFontsize.SIZE_42))
      ],
    );
    return Container(
      width: ScreenUtil().setWidth(1044),
      height: ScreenUtil().setWidth(460),
      margin: EdgeInsets.only(top: 15, bottom: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.COLOR_GRAY_F6F6F6,
        borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
      ),
      child: uploadBtn,
    );
  }
}

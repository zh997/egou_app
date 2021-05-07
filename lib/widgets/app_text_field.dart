import 'dart:ui';

import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';

enum TitleFlexType {Row, Column}
enum TextFieldType {Input, Upload}

class RowTextField extends StatefulWidget {
  final Key key;
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode = FocusNode();
  final String labelText;
  final String title;
  final bool isRequired;
  final Widget icon;
  final Widget suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final AlignmentDirectional labelAlignment;
  final double contentPaddingTop;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingBottom;
  final int maxLength;
  final int maxLines;
  final int minLines;
  final Function onTap;
  final double labelLeft;
  final double labelRight;
  final double labelBottom;
  final double labelTop;
  final double height;
  final TitleFlexType titleFlexType;
  final EdgeInsetsGeometry padding;
  final TextAlign textAlign;
  final TextFieldType textFieldType ;
  final bool showBorder;
  final List<String> imgList;
  final int maxImgLength;
  String Function(dynamic value) validate;
  RowTextField({
    this.key,
    this.labelText,
    this.title,
    this.isRequired = false,
    this.suffixIcon,
    this.obscureText = false,
    this.icon,
    this.readOnly = false,
    this.contentPaddingTop = 0,
    this.contentPaddingLeft = 0,
    this.contentPaddingRight = 0,
    this.contentPaddingBottom = 0,
    this.onTap, this.name,
    this.validate,
    this.controller,
    this.labelLeft,
    this.labelRight,
    this.labelBottom,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelAlignment = AlignmentDirectional.centerStart,
    this.titleFlexType = TitleFlexType.Row,
    this.padding,
    this.height, this.textAlign = TextAlign.start,
    this.textFieldType = TextFieldType.Input,
    this.labelTop,
    this.showBorder = true, this.imgList, this.maxImgLength = 2
  }) : super(key: key);

  @override
  _RowTextFieldState createState() => _RowTextFieldState();
}

class _RowTextFieldState extends State<RowTextField> {

  String errorText = '';
  bool isShowLabelText = true;


  void setErrorText(String text) {
    setState(() {
      errorText = text;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.focusNode.addListener(_listenerFocus);
    widget.controller.addListener(_listenerChangeVal);
    _listenerChangeVal();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.focusNode.removeListener(_listenerFocus);
    widget.controller.removeListener(_listenerChangeVal);
    super.dispose();
  }

  void _listenerFocus() {
    if(widget.focusNode.hasFocus && !widget.readOnly) {
      setState(() {
        isShowLabelText = false;
      });
    } else {
      if (!widget.controller.text.isNotEmpty) {
        setState(() {
          isShowLabelText = true;
        });
      }
    }
  }

  void _listenerChangeVal() {
    if (widget.controller.text.isNotEmpty) {
      setState(() {
        isShowLabelText = false;
      });
    }
  }

  void _onChanged(String val) {
    if (widget.validate != null &&  widget.validate is Function) {
      final errorMessage = widget.validate(val);
      if (errorMessage.isNotEmpty){
        setState(() {
          errorText = errorMessage;
        });
      } else {
        setState(() {
          errorText = '';
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> textFieldItem;
    // 标题
    final title = [
      Text('${widget.title ?? ''}', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
      Container(
        width: 8,
        child: Text('${widget.isRequired ? '*' : ''}', style: TextStyle(color: AppColors.COLOR_PRIMARY_FF733E, fontSize: AppFontsize.SIZE_48)),
      ),
    ];

    // 下划线
    final bottomLine = BorderSide(width: 1, color: errorText.isNotEmpty ? AppColors.COLOR_PRIMARY_D22315 : AppColors.COLOR_GRAY_DDDDDD);

    // 输入框
    if (widget.textFieldType == TextFieldType.Input) {
      textFieldItem = [
        Expanded(child: Stack(
          alignment: widget.labelAlignment,
          children: [
            Positioned(child: widget.labelText != null && isShowLabelText ?
            Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(widget.labelText, style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_GRAY_CCCCCC)),
            ) : SizedBox(),
              left: widget.labelLeft,
              right: widget.labelRight,
              bottom: widget.labelBottom,
              top: widget.labelTop
            ),
            TextFormField(
              controller:  widget.controller,
              focusNode:  widget.focusNode,
              textInputAction: TextInputAction.next,
              obscureText: widget.obscureText,
              style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_PRIMARY_D22315),
              cursorColor: AppColors.COLOR_PRIMARY_D22315,
              scrollPadding: EdgeInsets.only(),
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              onChanged: _onChanged,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              textAlign: widget.textAlign,
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
                ) : SizedBox();
              },
              decoration: InputDecoration(
                  icon: widget.icon,
                  contentPadding: EdgeInsets.only(
                      top: widget.contentPaddingTop,
                      left:  widget.contentPaddingLeft,
                      right:  widget.contentPaddingRight,
                      bottom:  widget.contentPaddingBottom
                  ),
                  hasFloatingPlaceholder: false,
                  border: InputBorder.none,
                  hoverColor: AppColors.COLOR_PRIMARY_D22315,
                  focusColor: AppColors.COLOR_PRIMARY_D22315
              ),
            )
          ],
        )),
        widget.suffixIcon ?? SizedBox()
      ];
    }

    if (widget.textFieldType == TextFieldType.Upload) {
      textFieldItem = [
        Expanded(child:_upload())
      ];
    }


    final Widget RowItem = Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          border: widget.showBorder ? Border(bottom: bottomLine) : Border(bottom: BorderSide.none)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.title != null ? Row(
            children: title,
          ) : SizedBox(),
          Expanded(
            child: Row(
              children: textFieldItem,
            ),
          )
        ],
      )
    );

    final Widget ColumnItem = Container(
        padding: widget.padding,
        height: widget.height ,
        decoration: BoxDecoration(
            border: widget.showBorder ? Border(bottom: bottomLine) : Border(bottom: BorderSide.none)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.title != null ? Row(
              children: title,
            ) : SizedBox(),
            Expanded(child: Row(
              children: textFieldItem,
            ))
          ],
        )
    );


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleFlexType == TitleFlexType.Row ? RowItem : ColumnItem,
        errorText.isNotEmpty ? Text(errorText, style: TextStyle(color:  AppColors.COLOR_PRIMARY_D22315 ), maxLines: 1) : SizedBox()
      ],
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
    return Column(
      children: [
        widget.imgList != null && widget.imgList.length > 0 ? Column(
          children: List.generate(widget.imgList.length, (index) => Container(
            width: ScreenUtil().setWidth(1044),
            height: ScreenUtil().setWidth(460),
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.COLOR_GRAY_F6F6F6,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
            ),
            child: Image.network(widget.imgList[index], fit: BoxFit.cover),
          )),
        ) : SizedBox(),
        widget.imgList != null && widget.imgList.length < widget.maxImgLength ?
        GestureDetector(
          onTap: widget.onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: ScreenUtil().setWidth(1044),
            height: ScreenUtil().setWidth(460),
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.COLOR_GRAY_F6F6F6,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
            ),
            child: uploadBtn,
          ),
        ) : SizedBox()
      ],
    );
  }
}

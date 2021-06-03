import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:egou_app/models/order_detail.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:image_picker_web/image_picker_web.dart';
import 'package:get/get.dart' as getx;

import 'logic.dart';
import 'state.dart';


class PublishCommentsPage extends StatefulWidget {
  @override
  _PublishCommentsPageState createState() => _PublishCommentsPageState();
}

class _PublishCommentsPageState extends State<PublishCommentsPage> {
  final PublishCommentsLogic logic = getx.Get.put(PublishCommentsLogic());
  final PublishCommentsState state = getx.Get.find<PublishCommentsLogic>().state;
  final TextEditingController _commentController = TextEditingController();

  File _image;
  final ImagePicker _picker = ImagePicker();

  Future _futtur;
  String id = getx.Get.parameters['id'];

  final List SmilingFaceMap = [
    {
      'icon': AppImages.COMMENT_ICON_31,
      'selected_icon': AppImages.COMMENT_ICON_32,
      'text': '好评'
    },
    {
      'icon': AppImages.COMMENT_ICON_21,
      'selected_icon': AppImages.COMMENT_ICON_22,
      'text': '中评'
    },
    {
      'icon': AppImages.COMMENT_ICON_11,
      'selected_icon': AppImages.COMMENT_ICON_12,
      'text': '差评'
    }
  ];

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery, imageQuality: 1);
    if (pickedFile != null) {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _upLoadImage(_image);
      }
    }
    // html.File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    // var formData = html.FormData();
    // formData.appendBlob("file", infos.slice(), infos.name);
    // await logic.uploadImg(formData);
  }

  _upLoadImage(File image) async {

    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(path, filename:name)
    });

    await logic.appUploadImg(formdata);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futtur = logic.onGetOrderDetail(int.parse(id));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _futtur, builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '发表评论'),
          body: SafeArea(
            child: getx.Obx((){
              final int description_comment = state.description_comment.value;
              final int service_comment = state.service_comment.value;
              final int express_comment = state.express_comment.value;
              final int goods_comment = state.goods_comment.value;
              final List image = state.image.value;
              final OrderDetailModel orderDetail = state.orderDetail.value;
              return ListView(
                children: [
                  SizedBox(height: 15),
                  Container(
                    color:  Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: List.generate(orderDetail.orderGoods.length, (index) => _goodsItem(orderDetail.orderGoods[index])),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('描述相符', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333)),
                            Row(
                                children: List.generate(SmilingFaceMap.length, (index) => _SmilingFace(
                                    SmilingFaceMap[index], description_comment - 1 == index ,index))
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: ScreenUtil().setWidth(460),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppRadius.RADIUS_20),
                              color: AppColors.COLOR_GRAY_EFEFEF
                          ),
                          child: RowTextField(
                            key: GlobalKey(),
                            controller: _commentController,
                            labelText: '请输入评价',
                            contentPaddingTop: 15,
                            contentPaddingLeft: 30,
                            contentPaddingRight: 30,
                            labelLeft: 30,
                            labelTop: 21,
                            maxLines: 5,
                            height: 80,
                            showBorder: false,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Row(
                                children: List.generate(image.length, (index) => _imgItem(image[index], index, ))
                            ),
                            image.length < 3 ? GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () async {
                                await getImage();
                              },
                              child: Container(
                                width: ScreenUtil().setWidth(322),
                                height: ScreenUtil().setWidth(322),
                                decoration: BoxDecoration(
                                    color: AppColors.COLOR_GRAY_F6F6F6,
                                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(height: 10),
                                    Text('添加照片', style: TextStyle(color: AppColors.COLOR_BLACK_333333,
                                        fontSize: AppFontsize.SIZE_52))
                                  ],
                                ),
                              ),
                            ) : SizedBox()
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('物流服务', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                            SizedBox(width: 50),
                            Row(
                                children: List.generate(5, (index) => _StarReview('express_comment', index < express_comment, index))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(height: 1, color: AppColors.COLOR_GRAY_F8F8F8),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('商家服务', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                            SizedBox(width: 50),
                            Row(
                                children: List.generate(5, (index) => _StarReview('service_comment', index < service_comment, index))
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 15),
                  // Container(
                  //   padding: EdgeInsets.all(15),
                  //   color: Colors.white,
                  //   child: Row(
                  //     children: [
                  //       Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52),height: ScreenUtil().setWidth(52)),
                  //       SizedBox(width: 5),
                  //       Text('匿名评价', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 15),
                  Container(
                      height: ScreenUtil().setWidth(200),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                      ),
                      child: RadiusButton('提交', onTap: () {
                        final Map<String, dynamic> data = {};
                        data['comment'] = _commentController.text;
                        data['service_comment'] = service_comment;
                        data['express_comment'] = express_comment;
                        data['description_comment'] = description_comment;
                        data['goods_comment'] = goods_comment;
                        data['image'] = image;
                        data['id'] = int.parse(id);
                        logic.onAddComment(data);
                      })
                  )
                ],
              );
            }),
          ),
        );
      }
      return SpinKit();
    });
  }

  Widget _goodsItem(OrderGoods item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setWidth(150),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F6F6F6, width: 2)
            ),
            child: Image.network(item.image, fit: BoxFit.cover),
            clipBehavior: Clip.hardEdge,
          ),
          SizedBox(width: 15),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.goodsName, style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_222222), maxLines: 1, overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                    color: AppColors.COLOR_GRAY_F6F6F6,
                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_11)
                ),
                child: Text(item.specValue, style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_GRAY_999999)),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _StarReview(String key, isSelected, index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        logic.onChangForm(key, index);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Image.asset(isSelected ? AppImages.STAR_ICON_SELECTED : AppImages.STAR_ICON,
            width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
      ),
    );
  }

  Widget _imgItem(String src, int index) {
    return Stack(
      children: [
        Container(
          width: ScreenUtil().setWidth(322),
          height: ScreenUtil().setWidth(322),
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: AppColors.COLOR_GRAY_F6F6F6,
              borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(src),
        ),
        Positioned(top: 10, right: 10, child: GestureDetector(
          onTap: () {
            logic.removeImg(index);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0x7F000000)
            ),
            child: Icon(Icons.close, color: Colors.white,),
          ),
        ))
      ],
    );
  }

  Widget _SmilingFace(Map<String, dynamic> item,bool isSelected,int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        logic.onChangForm('description_comment', index);
      },
      child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Image.asset(isSelected ? item['selected_icon'] : item['icon'], width: ScreenUtil().setWidth(80), height: ScreenUtil().setWidth(80)),
              SizedBox(width: 5),
              Text(item['text'], style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333))
            ],
          )
      ),
    );
  }
}

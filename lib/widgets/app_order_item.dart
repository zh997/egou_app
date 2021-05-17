import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {

  final String img;
  final String name;
  final List<GoodsSpec> goodsSpec;
  final String specValueStr;
  final int num;
  final String price;

  const OrderItem({Key key, this.img, this.name, this.goodsSpec, this.price, this.specValueStr, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String spec_value_str = specValueStr != null ? specValueStr : '';
    if (goodsSpec != null && goodsSpec.length > 0) {
      goodsSpec.forEach((element) {
        if (element.specValue.length > 0) {
          spec_value_str =  spec_value_str + element.name + ':' + element.specValue[0].value + ' ';
        }
      });
    };
    return Container(
      child: Row(
        children: [
          Container(
            width:  ScreenUtil().setWidth(300),
            height:  ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
            ),
            child: Image.network(img, fit: BoxFit.cover),
          ),
          Expanded(child: SizedBox(
            height:  ScreenUtil().setWidth(300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48), maxLines: 2, overflow: TextOverflow.ellipsis,),
                spec_value_str != null ? Text(spec_value_str, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_41), maxLines: 1, overflow: TextOverflow.ellipsis,): SizedBox(),
                // SizedBox(height: 5),
                // Container(color: AppColors.COLOR_PRIMARY_D22315, padding: EdgeInsets.fromLTRB(5, 2,5,2), child: Text('特例品', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_32))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Price(price: price,),
                    Text('数量x${num}', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

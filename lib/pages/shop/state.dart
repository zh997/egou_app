import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/shop_category_list.dart';
import 'package:get/get.dart';

class ShopState {
  RxList gridList = [].obs;
  RxList shopEntryList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  ShopState() {
    ///Initialize variables
    // this.gridList = [
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_1, 'text': '酒店'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_2, 'text': 'KTV'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_3, 'text': '健康'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_4, 'text': '餐饮'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_5, 'text': '服装'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_6, 'text': '会所'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_7, 'text': '旅游'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_8, 'text': '百货'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_9, 'text': '汽车4S店'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_10, 'text': '企业服务'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_11, 'text': '教育'}),
    //   ShopGridListItem({'icon': AppImages.SHOP_GRID_ICON_12, 'text': '团建'}),
    // ].obs;
  }
}

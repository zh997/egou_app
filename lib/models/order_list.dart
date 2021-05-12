OrderListItem OrderListItemFromJson(json) => OrderListItem.fromJson(json);

class OrderListItem {
  int id;
  String orderSn;
  int orderStatus;
  int payStatus;
  String orderAmount;
  int orderType;
  int shippingStatus;
  String createTime;
  List<OrderGoods> orderGoods;
  int goodsCount;
  int payBtn;
  int cancelBtn;
  int deliveryBtn;
  int takeBtn;
  int delBtn;
  int commentBtn;
  int orderCancelTime;

  OrderListItem(
      {this.id,
        this.orderSn,
        this.orderStatus,
        this.payStatus,
        this.orderAmount,
        this.orderType,
        this.shippingStatus,
        this.createTime,
        this.orderGoods,
        this.goodsCount,
        this.payBtn,
        this.cancelBtn,
        this.deliveryBtn,
        this.takeBtn,
        this.delBtn,
        this.commentBtn,
        this.orderCancelTime});

  OrderListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderSn = json['order_sn'];
    orderStatus = json['order_status'];
    payStatus = json['pay_status'];
    orderAmount = json['order_amount'];
    orderType = json['order_type'];
    shippingStatus = json['shipping_status'];
    createTime = json['create_time'];
    if (json['order_goods'] != null) {
      orderGoods = new List<OrderGoods>();
      json['order_goods'].forEach((v) {
        orderGoods.add(new OrderGoods.fromJson(v));
      });
    }
    goodsCount = json['goods_count'];
    payBtn = json['pay_btn'];
    cancelBtn = json['cancel_btn'];
    deliveryBtn = json['delivery_btn'];
    takeBtn = json['take_btn'];
    delBtn = json['del_btn'];
    commentBtn = json['comment_btn'];
    orderCancelTime = json['order_cancel_time'] is int ? json['order_cancel_time'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_sn'] = this.orderSn;
    data['order_status'] = this.orderStatus;
    data['pay_status'] = this.payStatus;
    data['order_amount'] = this.orderAmount;
    data['order_type'] = this.orderType;
    data['shipping_status'] = this.shippingStatus;
    data['create_time'] = this.createTime;
    if (this.orderGoods != null) {
      data['order_goods'] = this.orderGoods.map((v) => v.toJson()).toList();
    }
    data['goods_count'] = this.goodsCount;
    data['pay_btn'] = this.payBtn;
    data['cancel_btn'] = this.cancelBtn;
    data['delivery_btn'] = this.deliveryBtn;
    data['take_btn'] = this.takeBtn;
    data['del_btn'] = this.delBtn;
    data['comment_btn'] = this.commentBtn;
    data['order_cancel_time'] = this.orderCancelTime;
    return data;
  }
}

class OrderGoods {
  int id;
  int orderId;
  int goodsId;
  int itemId;
  String goodsName;
  int goodsNum;
  String goodsPrice;
  String totalPrice;
  String totalPayPrice;
  String discountPrice;
  String integralPrice;
  String specValueIds;
  int refundStatus;
  int isComment;
  int isSeckill;
  String goodsInfo;
  int createTime;
  String specValue;
  String image;

  OrderGoods(
      {this.id,
        this.orderId,
        this.goodsId,
        this.itemId,
        this.goodsName,
        this.goodsNum,
        this.goodsPrice,
        this.totalPrice,
        this.totalPayPrice,
        this.discountPrice,
        this.integralPrice,
        this.specValueIds,
        this.refundStatus,
        this.isComment,
        this.isSeckill,
        this.goodsInfo,
        this.createTime,
        this.specValue,
        this.image});

  OrderGoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    goodsId = json['goods_id'];
    itemId = json['item_id'];
    goodsName = json['goods_name'];
    goodsNum = json['goods_num'];
    goodsPrice = json['goods_price'];
    totalPrice = json['total_price'];
    totalPayPrice = json['total_pay_price'];
    discountPrice = json['discount_price'];
    integralPrice = json['integral_price'];
    specValueIds = json['spec_value_ids'];
    refundStatus = json['refund_status'];
    isComment = json['is_comment'];
    isSeckill = json['is_seckill'];
    goodsInfo = json['goods_info'];
    createTime = json['create_time'];
    specValue = json['spec_value'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['goods_id'] = this.goodsId;
    data['item_id'] = this.itemId;
    data['goods_name'] = this.goodsName;
    data['goods_num'] = this.goodsNum;
    data['goods_price'] = this.goodsPrice;
    data['total_price'] = this.totalPrice;
    data['total_pay_price'] = this.totalPayPrice;
    data['discount_price'] = this.discountPrice;
    data['integral_price'] = this.integralPrice;
    data['spec_value_ids'] = this.specValueIds;
    data['refund_status'] = this.refundStatus;
    data['is_comment'] = this.isComment;
    data['is_seckill'] = this.isSeckill;
    data['goods_info'] = this.goodsInfo;
    data['create_time'] = this.createTime;
    data['spec_value'] = this.specValue;
    data['image'] = this.image;
    return data;
  }
}
OrderDetailModel OrderDetailModelFromJson(json) => OrderDetailModel.fromJson(json);

class OrderDetailModel {
  int id;
  String orderSn;
  int orderType;
  int orderStatus;
  int payWay;
  String payTime;
  String consignee;
  String mobile;
  int deliveryType;
  String goodsPrice;
  String orderAmount;
  String discountAmount;
  String integralAmount;
  String totalAmount;
  int totalNum;
  String shippingPrice;
  int shippingTime;
  String userRemark;
  int confirmTakeTime;
  String cancelTime;
  int refundStatus;
  int settleId;
  String settleAmount;
  int useIntegral;
  String refundAmount;
  String orderRemarks;
  int createTime;
  int updateTime;
  int couponListId;
  int deliveryId;
  List<OrderGoods> orderGoods;
  String deliveryAddress;
  int payBtn;
  int cancelBtn;
  int deliveryBtn;
  int takeBtn;
  int delBtn;
  int orderCancelTime;
  String payWayText;

  OrderDetailModel(
      {this.id,
        this.orderSn,
        this.orderType,
        this.orderStatus,
        this.payWay,
        this.payTime,
        this.consignee,
        this.mobile,
        this.deliveryType,
        this.goodsPrice,
        this.orderAmount,
        this.discountAmount,
        this.integralAmount,
        this.totalAmount,
        this.totalNum,
        this.shippingPrice,
        this.shippingTime,
        this.userRemark,
        this.confirmTakeTime,
        this.cancelTime,
        this.refundStatus,
        this.settleId,
        this.settleAmount,
        this.useIntegral,
        this.refundAmount,
        this.orderRemarks,
        this.createTime,
        this.updateTime,
        this.couponListId,
        this.deliveryId,
        this.orderGoods,
        this.deliveryAddress,
        this.payBtn,
        this.cancelBtn,
        this.deliveryBtn,
        this.takeBtn,
        this.delBtn,
        this.orderCancelTime,
        this.payWayText});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderSn = json['order_sn'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    payWay = json['pay_way'];
    payTime = json['pay_time'];
    consignee = json['consignee'];
    mobile = json['mobile'];
    deliveryType = json['delivery_type'];
    goodsPrice = json['goods_price'];
    orderAmount = json['order_amount'];
    discountAmount = json['discount_amount'];
    integralAmount = json['integral_amount'];
    totalAmount = json['total_amount'];
    totalNum = json['total_num'];
    shippingPrice = json['shipping_price'];
    shippingTime = json['shipping_time'] is int ? json['shipping_time'] : 0;
    userRemark = json['user_remark'];
    confirmTakeTime = json['confirm_take_time'] is int ? json['confirm_take_time'] : 0;
    cancelTime = json['cancel_time'];
    refundStatus = json['refund_status'];
    settleId = json['settle_id'];
    settleAmount = json['settle_amount'] is String ? json['settle_amount'] : "";
    useIntegral = json['use_integral'];
    refundAmount = json['refund_amount'] is String ? json['refund_amount'] : "";
    orderRemarks = json['order_remarks'];
    createTime = json['create_time'] is int ? json['create_time'] : 0;
    updateTime = json['update_time'] is int ?  json['update_time'] : 0;
    couponListId = json['coupon_list_id'] is int ? json['coupon_list_id'] : 0;
    deliveryId = json['delivery_id'];
    if (json['order_goods'] != null) {
      orderGoods = new List<OrderGoods>();
      json['order_goods'].forEach((v) {
        orderGoods.add(new OrderGoods.fromJson(v));
      });
    }
    deliveryAddress = json['delivery_address'];
    payBtn = json['pay_btn'];
    cancelBtn = json['cancel_btn'];
    deliveryBtn = json['delivery_btn'];
    takeBtn = json['take_btn'];
    delBtn = json['del_btn'];
    orderCancelTime = json['order_cancel_time'] is int ? json['order_cancel_time'] : 0;
    payWayText = json['pay_way_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_sn'] = this.orderSn;
    data['order_type'] = this.orderType;
    data['order_status'] = this.orderStatus;
    data['pay_way'] = this.payWay;
    data['pay_time'] = this.payTime;
    data['consignee'] = this.consignee;
    data['mobile'] = this.mobile;
    data['delivery_type'] = this.deliveryType;
    data['goods_price'] = this.goodsPrice;
    data['order_amount'] = this.orderAmount;
    data['discount_amount'] = this.discountAmount;
    data['integral_amount'] = this.integralAmount;
    data['total_amount'] = this.totalAmount;
    data['total_num'] = this.totalNum;
    data['shipping_price'] = this.shippingPrice;
    data['shipping_time'] = this.shippingTime;
    data['user_remark'] = this.userRemark;
    data['confirm_take_time'] = this.confirmTakeTime;
    data['cancel_time'] = this.cancelTime;
    data['refund_status'] = this.refundStatus;
    data['settle_id'] = this.settleId;
    data['settle_amount'] = this.settleAmount;
    data['use_integral'] = this.useIntegral;
    data['refund_amount'] = this.refundAmount;
    data['order_remarks'] = this.orderRemarks;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['coupon_list_id'] = this.couponListId;
    data['delivery_id'] = this.deliveryId;
    if (this.orderGoods != null) {
      data['order_goods'] = this.orderGoods.map((v) => v.toJson()).toList();
    }
    data['delivery_address'] = this.deliveryAddress;
    data['pay_btn'] = this.payBtn;
    data['cancel_btn'] = this.cancelBtn;
    data['delivery_btn'] = this.deliveryBtn;
    data['take_btn'] = this.takeBtn;
    data['del_btn'] = this.delBtn;
    data['order_cancel_time'] = this.orderCancelTime;
    data['pay_way_text'] = this.payWayText;
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
  int commentBtn;
  int refundBtn;
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
        this.commentBtn,
        this.refundBtn,
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
    commentBtn = json['comment_btn'];
    refundBtn = json['refund_btn'];
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
    data['comment_btn'] = this.commentBtn;
    data['refund_btn'] = this.refundBtn;
    data['spec_value'] = this.specValue;
    data['image'] = this.image;
    return data;
  }
}
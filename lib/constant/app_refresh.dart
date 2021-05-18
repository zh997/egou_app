import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class AppRefresh {
  static Header getHeader(_headerKey) {
    return ClassicalHeader(
      key: _headerKey,
      refreshText: '下拉刷新',
      refreshReadyText: '准备刷新',
      refreshingText: '刷新中...',
      refreshedText: '刷新完成',
      showInfo:  false,
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      infoColor: Colors.black54,
    );
  }

  static Footer getFooter(_footerKey) {
    return ClassicalFooter(
      key: _footerKey,
      loadText: '上拉加载',
      loadReadyText: '准备加载',
      loadingText: '加载中...',
      loadedText: '加载完成',
      noMoreText: '没有更多',
      showInfo: false,
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      infoColor: Colors.black54,
    );
  }
}
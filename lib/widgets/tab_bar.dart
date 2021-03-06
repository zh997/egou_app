import 'package:egou_app/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class TabBarWidget extends StatefulWidget {
  final TabController tabController;
  final List labelList;
  final double itemPadding;
  final Color labelColor;
  final Color unselectedLabelColor;
  TabBarWidget(this.labelList,  this.tabController, {Key key, this.itemPadding, this.labelColor, this.unselectedLabelColor}):super(key: key);
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setWidth(120),
        alignment: Alignment.center,
        child: TabBar(
            controller: widget.tabController,
            isScrollable: true,
            labelColor: widget.labelColor,
            unselectedLabelColor: widget.unselectedLabelColor,
            labelStyle: TextStyle(fontSize: ScreenUtil().setSp(50), fontWeight: FontWeight.bold),
            unselectedLabelStyle:  TextStyle(fontSize: ScreenUtil().setSp(50)),
            labelPadding: EdgeInsets.only(),
            indicator: CustomIndicator(),
            tabs: List.generate(widget.labelList.length, (index) {
              final paddingLeftValue = index == 0 ? 52 : widget.itemPadding ?? 26;
              final paddingRightValue = index == widget.labelList.length - 1 ? 52 :  widget.itemPadding ?? 26;
              return Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(paddingLeftValue), right: ScreenUtil().setWidth(paddingRightValue)),
                alignment: Alignment.center,
                child: Text(widget.labelList[index].name),
              );
            })
        ),
    );
  }
}


class CustomIndicator extends Decoration{

  @override
  BoxPainter createBoxPainter([onChanged]) {
    print(onChanged);
    // TODO: implement createBoxPainter
    return CustomPainer();
  }

}

class CustomPainer extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final indicatorWidth = ScreenUtil().setWidth(40);
    final startOffset = (configuration.size.width - indicatorWidth) / 2 + offset.dx;
    final endOffset = startOffset + indicatorWidth;
    // TODO: implement paint
    final Paint painer = Paint();
    painer.strokeWidth = ScreenUtil().setHeight(10);
    painer.strokeCap = StrokeCap.round;
    painer.color = AppColors.COLOR_PRIMARY_D22315;
    canvas.drawLine(Offset(startOffset, ScreenUtil().setWidth(120)), Offset(endOffset, ScreenUtil().setWidth(120)), painer);
  }
}

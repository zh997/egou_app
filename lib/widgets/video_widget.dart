import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:zb_app/common/utils.dart';
import 'package:zb_app/constant/app_strings.dart';
import 'package:zb_app/constant/app_text_styles.dart';


class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.getColor('#000000'),
      height: ScreenUtil().setWidth(500),
      child: _controller.value.isInitialized ? Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller),
          !_controller.value.isPlaying ? GestureDetector(
            onTap: () { setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });},
            child:  Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white) ,
              child: Center(child: Text(AppStrings.PLAY, style: AppTextStyles.COLOR_BLACK_2_SIZE_34)),
            ),
          ): Text(''),
          _controller.value.isPlaying ? Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () { setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });},
                child:  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white) ,
                  child: Center(child: Text(AppStrings.PAUSE, style: AppTextStyles.COLOR_BLACK_2_SIZE_34)),
                ),
              )
          ) :  Text('')
        ],
      ) : Center(child: Text('视频加载中', style: TextStyle(color: Utils.getColor('#ffffff')))),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

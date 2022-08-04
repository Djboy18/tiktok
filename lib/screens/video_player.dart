import'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  void initState() {
    super.initState();
    setState(() {
      _controller = VideoPlayerController.network(widget.videoUrl);
    });
    _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: VideoPlayer(_controller),
    );
  }
}

import 'dart:io';
import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/UploadVideoController.dart';
import 'package:tiktok_clone/widgets/textinputfield.dart';
import 'package:video_player/video_player.dart';
class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key, required this.videoFile, required this.path}) : super(key: key);
  final File videoFile;
  final String path;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
late VideoPlayerController _controller;
final TextEditingController _captionController = TextEditingController();
final TextEditingController _songController = TextEditingController();
  void initState() {
    super.initState();
    setState(() {
      _controller = VideoPlayerController.file(widget.videoFile);
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
    final uploadVideoController = Get.put(UploadVideoController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
            ),
            SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width-20,
                    child: TextInputField(controller: _songController,
                        text: "Song name",
                        icon: Icons.music_note,
                        isObscure: false),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width-20,
                    child: TextInputField(controller: _captionController,
                        text: "Caption",
                        icon: Icons.closed_caption,
                        isObscure: false),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    uploadVideoController.uploadVideo(_songController.text,
                        _captionController.text,
                        widget.path);
                  }, child: Text("share",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,

                  ),),
                  )

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}

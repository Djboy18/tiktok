import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/screens/ConfirmScreen.dart';
class AddVideo extends StatefulWidget {
   AddVideo({Key? key}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}


class _AddVideoState extends State<AddVideo> {
  pickvideo(ImageSource src)async{
    final video =  await ImagePicker().pickVideo(source: src);
    if (video == null) return;
    final videoTemporary = File(video.path);
    Get.to(ConfirmScreen(videoFile: videoTemporary, path:video.path ));
  }
  showOptionsDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Add your own video"),
        actions: [
          TextButton(
            onPressed: () {
              pickvideo(ImageSource.camera);
            },
            child: Row(
              children: [
                Icon(Icons.camera_alt,color: backgroundColor,),
                SizedBox(width: 3,),
                Text("Camera",style: TextStyle(color: backgroundColor),),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              pickvideo(ImageSource.gallery);
            },
            child: Row(
              children: [
                Icon(Icons.image,color: backgroundColor,),
                SizedBox(width: 3,),
                Text("Gallery",style: TextStyle(color: backgroundColor),),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.close,color: backgroundColor,),
                SizedBox(width: 3,),
                Text("Go back",style: TextStyle(color: backgroundColor),),
              ],
            ),


          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.6,
          child: ElevatedButton(
            onPressed: (){
             showOptionsDialog(context);
            },
            child: Text("Add Video"),
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide.none,
              )
            ),
          ),
        )
      ),
    );
  }
}

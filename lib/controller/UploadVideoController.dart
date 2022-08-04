import 'package:tiktok_clone/Model/VideoModel.dart';
import 'package:tiktok_clone/screens/HomeScreen.dart';
import 'package:video_compress/video_compress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UploadVideoController extends GetxController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage  = FirebaseStorage.instance;

   _compressVideo(String videoPath)async{
    final compressVideo = await VideoCompress.compressVideo(videoPath,
    quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
      includeAudio: true
    );
    return compressVideo?.file;
  }
  _compressImage(String videoPath)async{
    final thumbnails = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnails;
  }

  _uploadvideoToStorage(String id, String videopath)async{
    Reference ref = firebaseStorage.ref().child("videos").child(id);
    UploadTask task = ref.putFile(await _compressVideo(videopath));
    TaskSnapshot taskSnapshot = await task;
    String DownloadUrl = await taskSnapshot.ref.getDownloadURL();
    return DownloadUrl.toString();
  }

  _uploadimageToStorage(String id, String videopath)async{
    Reference ref = firebaseStorage.ref().child("thumbnails").child(id);
    UploadTask task = ref.putFile(await _compressImage(videopath));
    TaskSnapshot taskSnapshot = await task;
    String DownloadUrl = await taskSnapshot.ref.getDownloadURL();
    return DownloadUrl;
  }



  uploadVideo(String songName, String caption, String videoPath)async{
    try{
      String uid = await firebaseAuth.currentUser!.uid;
      DocumentSnapshot userdoc =  await firestore.collection("users").doc(uid).get();
      var allDocs = await firestore.collection("video").get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadvideoToStorage("video ${len}", videoPath);
      String thumbnail = await _uploadimageToStorage("video ${len}", videoPath);
    //  String thumbnail = " ";
     // String videoUrl = " ";

      VideoModel videoModel= VideoModel(
          username: (userdoc.data()! as Map<String,dynamic>)["name"],
          id: " video ${len}",
          uid: uid,
          likes: [],
          commentsCount: 0,
          shareCounts: 0,
          thumbnails: thumbnail,
          videoUrl: videoUrl,
          caption: caption,
          songname: songName,
          profilePhoto: (userdoc.data()! as Map<String,dynamic>)["profilePhoto"]);
     await firestore.collection("video").doc("video ${len}").set(videoModel.toJson());
     print("video uploaded");
     Get.offAll(HomeScreen());

    }catch(e){
      Get.snackbar("error uploading video", e.toString());
    }


  }
}
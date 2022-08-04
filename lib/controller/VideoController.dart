import 'package:cloud_firestore/cloud_firestore.dart';
import'package:get/get.dart';
import'package:tiktok_clone/Model/VideoModel.dart';
class VideoController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;
  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
        firestore.collection('video').snapshots().map((QuerySnapshot query) {
          List<VideoModel> retVal = [];
          for (var element in query.docs) {
            retVal.add(
              VideoModel.userFromSnap(element),
            );
          }
          return retVal;
        }));
  }

  
}
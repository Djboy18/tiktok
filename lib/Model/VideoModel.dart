import 'package:cloud_firestore/cloud_firestore.dart';
class VideoModel{
  String username;
  String id;
  String uid;
  List likes;
  int commentsCount;
  int shareCounts;
  String thumbnails;
  String videoUrl;
  String caption;
  String songname;
  String profilePhoto;

  VideoModel({
    required this.username,
    required this.id,
    required this.uid,
    required this.likes,
    required this.commentsCount,
    required this.shareCounts,
    required this.thumbnails,
    required this.videoUrl,
    required this.caption,
    required this.songname,
    required this.profilePhoto,
  });

  Map<String,dynamic> toJson() =>{
    "username": username,
    "id":id,
    "uid":uid,
    "likes":likes,
    "commentcount":commentsCount,
    "sharescount":shareCounts,
    "thumbnails":thumbnails,
    "videopath":videoUrl,
    "caption":caption,
    "songname":songname,
    "profilePhoto":profilePhoto,

  };
  static userFromSnap(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String,dynamic>;
    return VideoModel(username: snap["username"],
        id: snap["id"],
        uid: snap["uid"],
        likes: snap["likes"],
        commentsCount: snap["commentsCount"],
        shareCounts: snap["shareCounts"],
        thumbnails:snap ["thumbnails"],
        videoUrl: snap["videopUrl"],
        caption: snap["caption"],
        songname: snap ["songname"],
        profilePhoto: snap["profilePhoto"]);
  }


}
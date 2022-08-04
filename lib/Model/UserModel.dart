import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String profilePhoto;
  String email;
  String uid;
 UserModel({
   required this.name,
   required this.profilePhoto,
   required this.email,
   required this.uid,
});
 Map<String,dynamic> toJson() =>{
   "name": name,
   "profilePhoto":profilePhoto,
   "email":email,
   "uid":uid
 };
 static userFromSnap(DocumentSnapshot snapshot){
   var snap = snapshot.data() as Map<String,dynamic>;
   return UserModel(name: snap["name"],
       profilePhoto: snap["profilePhoto"],
       email: snap["email"],
       uid: snap["uid"]);
 }
}
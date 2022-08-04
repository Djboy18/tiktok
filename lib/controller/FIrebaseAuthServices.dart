import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:tiktok_clone/Model/UserModel.dart';
import 'package:tiktok_clone/screens/HomeScreen.dart';
import 'package:tiktok_clone/screens/SignInmethods/UsernameLogining.dart';
class FirebaseAuthServices extends GetxController{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Rx<File?> _pickedImage;
  late Rx<User?> _User;
  File? get profilePhoto => _pickedImage.value;
   void onReady(){
    super.onReady();
    _User = Rx<User?>(firebaseAuth.currentUser );
    _User.bindStream(firebaseAuth.authStateChanges());
    ever(_User, (callback) => setInitialPage);
  }
  setInitialPage(User? user){
     if(user == null){
       Get.offAll(LoginScreen());
     }
     else{
       Get.offAll(HomeScreen());
     }
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final user =  await FirebaseAuth.instance.signInWithCredential(credential);
    return user;
  }
  Future<String>uploadImageToFirebase(File image)async{
    final storageImg = await FirebaseStorage.
    instance.ref().child("profile pics").child(firebaseAuth.currentUser!.uid);
    TaskSnapshot task  = await storageImg.putFile(image);
    String downloadUrl = await task.ref.getDownloadURL();
    return downloadUrl;

  }
  pickImage()async{
    final images =  await ImagePicker().pickImage(source: ImageSource.gallery);
    if (images == null) return;
    _pickedImage = Rx<File?>(File(images.path));
  }

  void createUserWithEmailAndPassword(String email,
      String password, String username
      ,File? image
      )async{
    try{
      if(email.isNotEmpty && password.isNotEmpty &&
          username.isNotEmpty && image != null ){
        final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
       String url = await uploadImageToFirebase(image);
       UserModel user = UserModel(name: username,
           profilePhoto: url,
           email: email,
           uid: credential.user!.uid);
       await firestore.collection("users").doc(credential.user!.uid).set(user.toJson());
       print("good boy");

      }else{
        Get.snackbar("Tiktok"," Please fill in all data");
      }
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        Get.snackbar("error occuring", e.toString());
      } else if (e.code == 'email-already-in-use') {
     Get.snackbar("Tiktok", 'The account already exists for that email.');
      }
    }
  }
  void loginUser(String email,String password)async{
    try{
      if(email.isNotEmpty && password.isNotEmpty ){
        final credential = await firebaseAuth.signInWithEmailAndPassword(email: email,
            password: password);


      }else{
        Get.snackbar("Tiktok"," Please fill in all data");
      }
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        Get.snackbar("error occuring", e.toString());
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Tiktok", 'The account already exists for that email.');
      }
    }

  }
}
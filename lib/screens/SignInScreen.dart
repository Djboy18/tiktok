import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controller/FIrebaseAuthServices.dart';
import 'package:tiktok_clone/screens/HomeScreen.dart';
import 'package:tiktok_clone/screens/SignInmethods/GoogleSigning.dart';
import 'package:tiktok_clone/screens/SignInmethods/TwitterSigning.dart';
import 'package:tiktok_clone/screens/SignInmethods/InstagramSigning.dart';
import 'package:tiktok_clone/screens/SignInmethods/UsernameSigning.dart';
import 'package:tiktok_clone/screens/SignInmethods/FacebookSigning.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseAuthService = Get.put(FirebaseAuthServices());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed:null,
                  icon:Icon(Icons.close,color:Colors.black)
                ),
                IconButton(
                    onPressed:null,
                    icon:Icon(Icons.send_time_extension_sharp,color:Colors.black)
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 60),
              child: Text("sign up for TikTok",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
            ),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("create a profile, follow other "
                  "accounts,make your own videos, and more",style: TextStyle(
                  color: Colors.grey,
              ),),
            ),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  Get.to(UsernameSigning());
                },
                child: signin(Icons.person_outline_rounded, "Use phone or email")),
            SizedBox(height: 8,),
            InkWell(
                onTap: (){
                  Get.to(FacebookSigning());
                },
                child: signin(FontAwesomeIcons.facebook, "Connect with Facebook")),
            SizedBox(height: 8,),
            InkWell(
                onTap: ()async{
                 // Get.to(GoogleSigning());
                  await firebaseAuthService.signInWithGoogle();
                  Get.defaultDialog(title: "tiktok clone",middleText: " google signing enbled");
                  Get.off(HomeScreen());
                },
                child: signin(FontAwesomeIcons.google, "Connect with google")),
            SizedBox(height: 8,),
            InkWell(
                onTap: (){
                  Get.to(InstagramSigning());
                },
                child: signin(FontAwesomeIcons.instagram, "Connect with Instagram")),
            SizedBox(height: 8,),
            InkWell(
                onTap: (){
                  Get.to(TwitterSigning());
                },
                child: signin(FontAwesomeIcons.twitter, "Connect with twitter")),







          ]
        )
      )
    );
  }
  Widget signin(IconData iconed, String text){
    return Container(
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width * 0.81,
      decoration: BoxDecoration(
        border:Border.all(
            color: Colors.black12,
            width: 1.5,
        ),

      ),
      child: Row(
          children:[Icon(iconed,color: Colors.black,),
            SizedBox(width: 45,),
            Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
            ),)
          ]
      ),


    )
    ;
  }
}

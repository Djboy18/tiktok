import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/FIrebaseAuthServices.dart';
import 'package:tiktok_clone/widgets/textinputfield.dart';
class UsernameSigning extends StatefulWidget {
  const UsernameSigning({Key? key}) : super(key: key);

  @override
  State<UsernameSigning> createState() => _UsernameSigningState();
}
File? image;
TextEditingController _usernameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final String url = "https://tse4.mm.bing.net/th?id=OIP.awAiMS1BCAQ2xS2lcdXGlwHaHH&pid=Api&P=0&w=169&h=162";
bool showImage = false;


class _UsernameSigningState extends State<UsernameSigning> {
  @override
  Widget build(BuildContext context) {
    final firebaseservice = Get.find<FirebaseAuthServices>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("Tiktok Clone",style:
              TextStyle(color: buttonColor,
                  fontSize: 35,
                  fontWeight:FontWeight.w900
              ),),
              Text("Register",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: buttonColor,
                ),
              ),
              SizedBox(height: 15,),
              Stack(
                  children:[
                    CircleAvatar(
                      backgroundImage: NetworkImage("${url}"),
                      radius: 60,
                    ),
                    Positioned(child:
                    InkWell(
                      onTap: (){
                        firebaseservice.pickImage();
                        setState((){
                          showImage = true;
                        });
                      },
                      child: Icon(Icons.camera_alt,color: Colors.white,
                      size: 28,
                      ),
                    ),
                      bottom: 0,
                      right: 5,
                    )
                  ]
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(controller: _usernameController,
                    text: "Username",
                    icon: FontAwesomeIcons.circleUser,
                    isObscure:  false),
              ),
              SizedBox(height: 18,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(controller: _emailController,
                    text: "Email",
                    icon: Icons.email,
                    isObscure:  false),
              ),
              SizedBox(height: 18,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(controller: _passwordController,
                    text: "Password",
                    icon: Icons.password,
                    isObscure:  true),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  firebaseservice.createUserWithEmailAndPassword(_emailController.text,
                      _passwordController.text,
                      _usernameController.text,
                      firebaseservice.profilePhoto);
                },
                child: Container(
                    width:MediaQuery.of(context).size.width -40 ,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text("login",style: TextStyle(color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    )
                ),
              ),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 17
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print("hey");
                    },
                    child: Text("Login ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

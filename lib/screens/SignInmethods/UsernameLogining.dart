import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/FIrebaseAuthServices.dart';
import 'package:tiktok_clone/screens/SignInmethods/UsernameSigning.dart';
import 'package:tiktok_clone/widgets/textinputfield.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseservice = Get.find<FirebaseAuthServices>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tiktok Clone",style:
            TextStyle(color: buttonColor,
            fontSize: 35,
            fontWeight:FontWeight.w900
            ),),
            Text("login",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: buttonColor,
            ),
            ),
            SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(controller: _emailController,
                  text: "Email",
                  icon: Icons.email,
                  isObscure:  false),
            ),
            SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(controller: _passwordController,
                  text: "Password",
                  icon: Icons.password,
                  isObscure:  true),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: () => firebaseservice.loginUser(_emailController.text,
                  _passwordController.text),
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
                Text("Don't have an account ",
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 17
                ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(UsernameSigning());
                  },
                  child: Text("Register ",
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
    );
  }
}

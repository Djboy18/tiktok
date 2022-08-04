import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/screens/HomeScreen.dart';
import 'package:tiktok_clone/screens/SignInScreen.dart';
import 'package:tiktok_clone/screens/SignInmethods/UsernameLogining.dart';
import 'package:tiktok_clone/screens/SignInmethods/UsernameSigning.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'tiktok clone',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


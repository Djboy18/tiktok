import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/screens/AddVideo.dart';
import 'package:tiktok_clone/screens/VideoScreen.dart';
import 'package:tiktok_clone/screens/Inbox.dart';
import 'package:tiktok_clone/screens/Profile.dart';
import 'package:tiktok_clone/screens/SearchPage.dart';
import 'package:tiktok_clone/widgets/customIcon.dart';
import 'package:tiktok_clone/widgets/tiktok_icon.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0;
  List _screens=[VideoScreen(),SearchPage(),AddVideo(),Inbox(),Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int value){
          setState((){
            _currentIndex = value;
          });
        },
          backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.grey,fontSize: 11),
        selectedLabelStyle: TextStyle(color: Colors.white,
            fontSize: 11,fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(TikTokIcons.home,size: 22,),label: "home"),
          BottomNavigationBarItem(icon: Icon(TikTokIcons.search,size: 18,),label: "search"),
          BottomNavigationBarItem(icon: CustomIcon(),label: " "),
          BottomNavigationBarItem(icon: Icon(TikTokIcons.messages,size: 20,),label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(TikTokIcons.profile,size: 18,),label: "profile"),
        ],

      ),
      body: _screens[_currentIndex]
    );
  }
}

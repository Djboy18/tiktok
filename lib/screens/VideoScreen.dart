import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controller/VideoController.dart';
import 'package:tiktok_clone/screens/CircleAnimation.dart';
import 'package:tiktok_clone/screens/video_player.dart';
import 'package:tiktok_clone/widgets/tiktok_icon.dart';
class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class  _VideoScreenState extends State<VideoScreen> {
  final Color redColor = Color.fromRGBO(237, 20, 56, 1);
  Widget profilePicture( String imageurl){
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 23.8,
            backgroundImage: NetworkImage(imageurl),
          ),
        ),
        Positioned(
            bottom: -5,
            left: 10,
            right: 10,
            child: CircleAvatar(
          radius: 10,
          backgroundColor: redColor,
          child: Icon(Icons.add,color: Colors.white,size: 15,),
        ))
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final VideoController videoController = Get.put(VideoController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body:
      PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 1,
                  ),
                  itemBuilder: (context, index)
              {
               //final data = videoController.videoList[index];
                return Stack(
                  children: [
                 // VideoPlayerItem(videoUrl: data.videoUrl),
                    Column(
                      children: [
                        SizedBox(height: 30,),
                        Expanded(child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                           Expanded(
                               child: Container(
                                 padding: EdgeInsets.only(left: 20),
                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Text("lion",style: TextStyle(
                                       fontSize: 20,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,

                                     ),),
                                     Text("hi",style: TextStyle(
                                       fontSize: 15,
                                       color: Colors.white,
                                     ),),
                                     Row(
                                       children: [
                                         Icon(FontAwesomeIcons.music, color: Colors.white,size: 17,),
                                         SizedBox(width: 3,),
                                         Text("love",style: TextStyle(
                                           fontSize: 15,
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold,
                                         ),)
                                       ],
                                     )
                                   ],

                                 ),
                               )),
                            Container(
                              width: 90,
                              margin: EdgeInsets.only(top:size.height/3 ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  profilePicture("eee"),
                                  SizedBox(height: 20,),
                                  Column(
                                    children: [
                                      Icon(TikTokIcons.heart,color: redColor,size: 34,),
                                      SizedBox(height: 7,),
                                      Text("40", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),),
                                      SizedBox(height: 20,),
                                      Column(
                                        children: [
                                          Icon(TikTokIcons.chat_bubble,color: Colors.white,size: 34,),
                                          SizedBox(height: 7,),
                                          Text("400", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13
                                          ),)
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Column(
                                        children: [
                                          Icon(FontAwesomeIcons.solidBookmark,color: Colors.white,size: 34,),
                                          SizedBox(height: 7,),
                                          Text("20", style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13
                                          ),)
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Column(
                                        children: [
                                          Icon(TikTokIcons.reply,color: Colors.white,size: 25,),
                                          SizedBox(height: 7,),
                                          Text("share", style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),)
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      CircleAnimation()


                                    ],
                                  ),


                                ],
                              ),
                            )
                          ],
                        ))


                      ],
                    )
                  ],
                );

            }
          )

    );

  }
}

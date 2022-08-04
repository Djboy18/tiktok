import'package:flutter/material.dart';
class CircleAnimation extends StatefulWidget {
  const CircleAnimation({Key? key,}) : super(key: key);

  @override
  State<CircleAnimation> createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync:this,duration: Duration(milliseconds: 5000));
    _animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
    _controller.forward();
    _controller.repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: Tween(begin: 0.0,end: 1.0).animate(_controller),
      child: SizedBox(
        height: 60,
        width: 60,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all( 11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient:LinearGradient(colors: [Colors.black,Colors.grey]),
                borderRadius: BorderRadius.circular(25),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://i0.wp.com/musicafriq.com.ng/wp-content/uploads/2019/11/Fireboy-DML-Laughter-Tears-Goosebumps-Album.jpg?resize=696%2C696&ssl=1"),
                radius: 20,
              )
            )
          ],
        ),
      ),

    );
  }
}

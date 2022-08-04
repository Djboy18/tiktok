import'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children:[ Container(
          margin: EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 250, 45, 100),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
          Container(
            margin: EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              width: 38,

              child: Icon(Icons.add,color: Colors.black,),
            ),
          )
        ]
      ),
    );
  }
}

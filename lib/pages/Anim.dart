import 'package:donno/utils/TutoList.dart';
import 'package:flutter/material.dart';

class Anim extends StatefulWidget {
  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            width:double.infinity,
            height:200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit:BoxFit.cover
              )
            ),
            child: Text("Video Hosting!",style:TextStyle(
              fontFamily: 'Title',
              color:Colors.white,
              fontSize: 25,
            )),
          ),
          Flexible(
              child: TutoList(),
          )
        ],),
      )
    );
  }
}

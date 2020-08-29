import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:shimmer/shimmer.dart';

class Flash extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  changePage()async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  void initState() {
    super.initState();
    changePage();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Shimmer.fromColors(
                            baseColor: Colors.red,
                            highlightColor: Colors.yellow,
                            child: Text(
                              "Brighter Myanmar",
                              style: TextStyle(
                                fontFamily: "Title",
                                fontSize: 30,
                              ),
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('assets/bm.jpg')),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )),
            new Container(
              color: Colors.blueAccent,
              height: 30,
              child: new MarqueeWidget(
                text: Global.text,
                textStyle: new TextStyle(fontSize: 16.0, color: Colors.white70, fontFamily: "Body"),
                scrollAxis: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

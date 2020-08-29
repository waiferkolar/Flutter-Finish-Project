import 'package:donno/models/PostModel.dart';
import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PostModel post = Global.currentPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Hero(
                tag: "location-img-${post.imageUrl}",
                child: Image.asset(
                  "assets/bg.jpg",
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )),
              SizedBox(height: 30),
              Container(
                  height: 100,
                  child:ListTile(
                      title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800])),
                      subtitle: Text('${post.content.substring(0,100)} night stay for only', style: TextStyle(letterSpacing: 1)),
                      trailing: Icon(Icons.thumb_up))
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                        child: Text(Global.para, style: TextStyle(color: Colors.grey[600], height: 1.4))),
                  )
              ),
            ],
          ),
        ));
  }
}

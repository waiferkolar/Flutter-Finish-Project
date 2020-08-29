import 'package:donno/models/PostModel.dart';
import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PostModel post = PostModel(id: 1, title: "Post One", content: "Post One Content", imageUrl: "bm.jpg");

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
              ListTile(
                  title: Text(post.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800])),
                  subtitle:
                  Text('${post.content} night stay for only', style: TextStyle(letterSpacing: 1)),
                  trailing: Icon(Icons.remove_red_eye)),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(Global.para,
                          style: TextStyle(color: Colors.grey[600], height: 1.4)),
                    )),
              ),
            ],
          ),
        ));
  }
}

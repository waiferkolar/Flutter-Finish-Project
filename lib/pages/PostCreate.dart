import 'package:flutter/material.dart';

import '../models/PostModel.dart';
import '../models/PostModel.dart';
import '../models/PostModel.dart';

class PostCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _titleController = TextEditingController();
    var _contentController = TextEditingController();
    var _imageUrlController = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: "Content",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: "Image Url",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: ()async {
                  String title = _titleController.text;
                  String content = _contentController.text;
                  String imageUrl = _imageUrlController.text;
                  PostModel pm = PostModel(id:1,title: title,content: content,imageUrl: imageUrl);
                  await PostModel.insertPost(pm);
                  Navigator.pushReplacementNamed(context, "/home");
                },
                child: Text("Create Post"))
          ],
        ),
      ),
    ));
  }
}

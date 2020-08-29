import 'package:donno/models/PostModel.dart';
import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';

class PostEdit extends StatefulWidget {
  @override
  _PostEditState createState() => _PostEditState();
}

class _PostEditState extends State<PostEdit> {
  var _idController;
  var _titleController;
  var _contentController;
  var _imageUrlController;

  loadCurrentPost() async {
    PostModel pm = await PostModel.getPostById(Global.currentId);
    _idController = TextEditingController(text: pm.id.toString());
    _titleController = TextEditingController(text: pm.title);
    _contentController = TextEditingController(text: pm.content);
    _imageUrlController = TextEditingController(text: pm.imageUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadCurrentPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Post Edit")),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Column(
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: "Id",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                    onPressed: () async {
                      String id = _idController.text;
                      String title = _titleController.text;
                      String content = _contentController.text;
                      String imageUrl = _imageUrlController.text;
                      PostModel post = PostModel(id: int.parse(id), title: title, content: content, imageUrl: imageUrl);
                      await PostModel.updatePost(post);
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    child: Text("Update Post"))
              ],
            ),
          ),
        ));
  }
}

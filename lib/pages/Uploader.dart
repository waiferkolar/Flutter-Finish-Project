import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class Uploader extends StatefulWidget {
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final picker = ImagePicker();
  File file;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Container(
          child: file == null ?
          Image(image: AssetImage("assets/bm.jpg"),):
              Image.file(file)
          ,
        ),
        RaisedButton(
          onPressed: ()=> browseImage(),
          child: Text("Browse Image"),
        ),
        RaisedButton(
          onPressed: ()=> uploadImage(),
          child: Text("Upload Image"),
        )
    ],);
  }
  Future<void> browseImage()async{
    final pickFile = await picker.getImage(source: ImageSource.gallery);
    file = File(pickFile.path);
    setState(() {});
  }

  Future<void> uploadImage()async{
      var uri = Uri.parse("http://54.179.1.90:3000/gallery/singleImage");
      var request = http.MultipartRequest('POST',uri);
      request.fields['username'] = "Mg Mg";
      request.fields['password'] = "123123";
      request.files.add(await http.MultipartFile.fromPath('photo', file.path));
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);
  }
}

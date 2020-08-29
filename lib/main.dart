import 'package:donno/pages/Detail.dart';
import 'package:donno/pages/Flash.dart';
import 'package:donno/pages/Home.dart';
import 'package:donno/pages/PostCreate.dart';
import 'package:donno/pages/PostEdit.dart';
import 'package:donno/pages/Uploader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Uploader(),
      "/home": (context) => Home(),
      "/detail": (context) => Detail(),
      "/post_create": (context) => PostCreate(),
      "/post_edit": (context) => PostEdit(),
    },
  ));
}

import 'package:donno/pages/Detail.dart';
import 'package:donno/pages/Flash.dart';
import 'package:donno/pages/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context)=> Flash(),
      "/home":(context)=> Home(),
      "/detail":(context)=> Detail(),
    },
  ));
}

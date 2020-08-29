import 'package:donno/utils/Global.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class PostModel {
  int id;
  String title, content, imageUrl;

  PostModel({this.id, this.title, this.content, this.imageUrl});

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content, 'imageUrl': imageUrl};
  }

  static Future<void> insertPost(PostModel post) async {
    Database db = await Global.getConn();
    await db.insert(
      Global.POST_TABLE,
      post.toMap(),
    );
  }

  static Future<List<PostModel>> getAllPosts() async {
    Database db = await Global.getConn();
    final List<Map<String, dynamic>> maps = await db.query(Global.POST_TABLE);
    return List.generate(maps.length, (ind) {
      return PostModel(
        id: maps[ind]['id'],
        title: maps[ind]['title'],
        content: maps[ind]['content'],
        imageUrl: maps[ind]['imageUrl'],
      );
    });
  }
}





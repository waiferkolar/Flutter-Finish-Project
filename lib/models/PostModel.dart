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

  static Future<PostModel> getPostById(int id) async {
    Database db = await Global.getConn();
    List<String> columns = ['id', 'title', 'content', 'imageUrl'];
    final List<Map<String, dynamic>> map = await db.query(Global.POST_TABLE, columns: columns, where: "id=?", whereArgs: [id]);
    return PostModel(
      id: map[0]['id'],
      title: map[0]['title'],
      content: map[0]['content'],
      imageUrl: map[0]['imageUrl'],
    );
  }
  static Future<void> updatePost(PostModel post) async {
    Database db = await Global.getConn();
     await db.update(
        Global.POST_TABLE,
        post.toMap(),
        where: "id=?",
        whereArgs: [post.id]
    );
  }
  static Future<bool> deletePost(int id) async {
    Database db = await Global.getConn();
    await db.delete(
        Global.POST_TABLE,
        where: "id=?",
        whereArgs: [id]
    );
    return true;
  }
}

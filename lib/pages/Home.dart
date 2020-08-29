import 'package:donno/models/PostModel.dart';
import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel> posts = [PostModel(id: 1, title: "Post One", content: "Post One Content", imageUrl: "bm.jpg"), PostModel(id: 2, title: "Post Two", content: "Post Two Content", imageUrl: "coder.png"), PostModel(id: 3, title: "Post Three", content: "Post Three Content", imageUrl: "web.png"), PostModel(id: 1, title: "Post Four", content: "Post Four Content", imageUrl: "ios.png"), PostModel(id: 1, title: "Post Five", content: "Post Five Content", imageUrl: "android.png"), PostModel(id: 1, title: "Post 1", content: "Post One Content", imageUrl: "bm.jpg"), PostModel(id: 2, title: "Post 2", content: "Post Two Content", imageUrl: "coder.png"), PostModel(id: 3, title: "Post 3", content: "Post Three Content", imageUrl: "web.png"), PostModel(id: 1, title: "Post 4", content: "Post Four Content", imageUrl: "ios.png"), PostModel(id: 1, title: "Post 5", content: "Post Five Content", imageUrl: "android.png"), PostModel(id: 1, title: "Post 1", content: "Post One Content", imageUrl: "bm.jpg"), PostModel(id: 2, title: "Post 2", content: "Post Two Content", imageUrl: "coder.png"), PostModel(id: 3, title: "Post 3", content: "Post Three Content", imageUrl: "web.png"), PostModel(id: 1, title: "Post 4", content: "Post Four Content", imageUrl: "ios.png"), PostModel(id: 1, title: "Post 5", content: "Post Five Content", imageUrl: "android.png")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                SizedBox(
                  height: 182,
                  child: Text(
                    "Home Page",
                    style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, ind) {
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage("assets/${posts[ind].imageUrl}"),
                              ),
                            ),
                            title: Text(posts[ind].title, style: TextStyle(fontFamily: 'Title', fontSize: 15, fontWeight: FontWeight.bold)),
                            subtitle: Text(Global.text.substring(0, 30), style: TextStyle(fontFamily: 'Body', fontWeight: FontWeight.bold)),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/detail');
                                    },
                                    child: Icon(Icons.edit, color: Colors.amber),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.delete, color: Colors.redAccent),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.remove_red_eye, color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}

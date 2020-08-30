import 'package:flutter/material.dart';

class HeroDetail extends StatefulWidget {
  String title,subtitle,content,image;
  HeroDetail({Key key,this.title,this.subtitle,this.content,this.image});
  @override
  _HeroDetailState createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Column(children: [
          Flexible(
            child: Hero(
              tag:"list-image${widget.image}",
              child: Container(
                width:double.infinity,
                height:300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/${widget.image}"),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),
           ListTile(
                  title: Text(widget.title,style:TextStyle(
                    fontFamily: "Title",
                    fontWeight: FontWeight.bold
                  )),
                  subtitle: Text(widget.subtitle,style:TextStyle(
                      fontFamily: "SubTitle",
                      fontWeight: FontWeight.bold
                  )),
                  trailing: Icon(Icons.thumb_up),
                ),
          Expanded(
              child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.vertical,
              child: Text(widget.content))
          )
        ],),
      )
    );
  }
}

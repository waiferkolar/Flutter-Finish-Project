import 'package:donno/pages/HeroDetail.dart';
import 'package:donno/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TutoList extends StatefulWidget {
  @override
  _TutoListState createState() => _TutoListState();
}

class _TutoListState extends State<TutoList> {
  List<Tuple4> tutus = [
    Tuple4("Flutter Tutorials","For Android and iOS Application Development","flutter.jpg",Global.para),
    Tuple4("Python Programming","For Android and iOS Application Development","python.jpg",Global.para),
    Tuple4("PHP Tutorials","For Android and iOS Application Development","php.png",Global.para),
    Tuple4("Java Tutorials","For Android and iOS Application Development","java.jpg",Global.para),
    Tuple4("C# Tutorials","For Android and iOS Application Development","csharp.jpg",Global.para),
    Tuple4("Web Dev Tutorials","For Android and iOS Application Development","desktop.png",Global.para),
    Tuple4("Class Tutorials","For Android and iOS Application Development","class.jpg",Global.para)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tutus.length,
        itemBuilder: (context,ind){
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => HeroDetail(
                    title:tutus[ind].item1,
                    subtitle:tutus[ind].item2,
                    image:tutus[ind].item3,
                    content:tutus[ind].item4,
                )));
              },
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              leading: Hero(
                tag: "list-image${tutus[ind].item3}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                      image:AssetImage("assets/${tutus[ind].item3}"),
                      width: 70,
                      height:70
                  ),
                ),
              ),
              title: Text(tutus[ind].item1),
//            subtitle:Text(tutus[ind].item2),
              trailing: Icon(Icons.arrow_right),
            ),
          );
        }
    );
  }
}

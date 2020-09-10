import 'package:flutter/material.dart';
//import 'wp-rest.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailScreenPost extends StatefulWidget {
  final String title;
  final String text;
  DetailScreenPost(this.title,this.text);
  @override
  DetailScreen createState() => DetailScreen(title,text);
}


class DetailScreen extends State<DetailScreenPost> {
  String title;
  String text;
  DetailScreen(this.title,this.text);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('RUVEM BLOG'),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: SingleChildScrollView(
          child: Card(
              child: Padding(
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(data: text),
                      ),
                    ],
                  )
              )
          ),
        )
    );
  }
}
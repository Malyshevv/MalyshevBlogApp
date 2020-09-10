import 'package:flutter/material.dart';
import 'wp-rest.dart';
import 'package:html/parser.dart';
import 'post.dart';
import 'Drawer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('RUVEM BLOG'),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: Container(
          child: FutureBuilder(
            future: fetchWpPosts(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    Map wppost = snapshot.data[index];
                    var imageUrl = (wppost['_embedded']['wp:featuredmedia'] != null) ? wppost['_embedded']['wp:featuredmedia'][0]['source_url'] : 'https://www.tellerreport.com/images/no-image.png';
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Image.network(imageUrl),
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                              child: Center(child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: imageUrl)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(wppost['title']['rendered'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(parse((wppost['excerpt']['rendered']).toString()).documentElement.text),
                            ),
                            Center(
                              child: RaisedButton.icon(
                                onPressed: () {
                                  //print(wppost['id']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreenPost(wppost['title']['rendered'],wppost['content']['rendered']),
                                      )
                                  );
                                },
                                color: Colors.indigo,
                                textColor: Colors.white,
                                icon: Icon(Icons.article_outlined),
                                label: Text('Узнать больше'),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Container(
                  child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                  )
              );
            },
          ),
        ),
        drawer: AppDrawer(),
      ),
    ),
  );
}


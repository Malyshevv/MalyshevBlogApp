import 'package:flutter/material.dart';
import 'contact.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[900]),
              accountName: Text('MalyshevBLOG'),
              accountEmail: Text('malyshev.dev@ya.ru'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/image-1.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple[900],
            ),
          ),
          new ListTile(
              title: new Text("Обратная связь"),
              leading: Icon(Icons.email),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactForm(),
                    )
                );
              }
          ),
          new ListTile(
              title: new Text("Instagram"),
              onTap: () {
                const url = 'https://instagram.com/fred_astairee';
                  if (canLaunch(url) != null) {
                    launch(url);
                  } else {
                    print('Невозможно открыть страницу - $url');
                  }
              }
          ),
          new ListTile(
              title: new Text("VK"),
              onTap: () {
                const url = 'https://vk.com/id244766661';
                  if (canLaunch(url) != null) {
                     launch(url);
                  } else {
                    print('Невозможно открыть страницу -  $url');
                  }
              }
          )
        ],
      ),
    );
  }
}
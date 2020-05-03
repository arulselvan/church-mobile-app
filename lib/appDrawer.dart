import 'package:flutter/material.dart';
import './about.dart';
import './videos.dart';
import './contact.dart';
import './prayer-request.dart';
import './live.dart';
import './login.dart';
import './home.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/images/llm-logo.png"),
                      fit: BoxFit.fitWidth)),
              child: DrawerHeader(
                child: Padding(
                  padding: EdgeInsets.only(top: 70),
                  //Builder needed to provide mediaQuery context from material app
                  child: new ButtonBar(
                    mainAxisSize: MainAxisSize.max,
                    alignment: MainAxisAlignment.center,
                    // this will take space as minimum as posible(to center)
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text('SignIn'),
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xffBDD300),
              size: 40,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LLMHomePage()),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/about.png'),
              color: null,
              width: 34,
              height: 34,
              alignment: Alignment.centerLeft,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/live.png'),
              color: null,
              width: 34,
              height: 34,
              alignment: Alignment.centerLeft,
            ),
            title: Text(
              'Live',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Live()),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/videos.png'),
              color: null,
              width: 34,
              height: 34,
              alignment: Alignment.centerLeft,
            ),
            title: Text(
              'Videos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideosGallary()));
            },
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/prayer.png'),
              color: null,
              alignment: Alignment.centerLeft,
              width: 34,
              height: 34,
            ),
            title: Text(
              'Prayer Request',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrayerRequest()),
              );
            },
          ),
          ListTile(
            leading: Image(
              image: AssetImage('assets/images/contact.png'),
              color: null,
              alignment: Alignment.centerLeft,
              width: 34,
              height: 34,
            ),
            title: Text(
              'Contact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
          ),
        ],
      ),
    );
  }
}

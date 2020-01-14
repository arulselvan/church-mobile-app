import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './about.dart';

void main() => runApp(LLMApp());

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
];

class LLMApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LLM App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LLMHomePage(title: 'LLM Church'),
    );
  }
}

class LLMHomePage extends StatefulWidget {
  LLMHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LLMHomePageState createState() => _LLMHomePageState();
}

CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
  return CarouselSlider(
    autoPlay: true,
    viewportFraction: 1.0,
    aspectRatio: 1.0,
    items: imgList.map(
      (url) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      },
    ).toList(),
  );
}

class _LLMHomePageState extends State<LLMHomePage> {
  int _counter = 0;

  //Auto playing carousel
  final CarouselSlider autoPlayDemo = CarouselSlider(
    viewportFraction: 1.0,
    aspectRatio: 1.5,
    autoPlay: true,
    items: imgList.map(
      (url) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      },
    ).toList(),
  );

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/home_bg.jpeg")),
            backgroundBlendMode: BlendMode.clear,
            color: Color(0xff48A6DC)),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 0),
                //Builder needed to provide mediaQuery context from material app
                child: Builder(builder: (context) {
                  return Column(children: [
                    getFullScreenCarousel(context),
                  ]);
                })),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: 60,
                    color: Colors.green[400],
                  ),
                  Icon(
                    Icons.people,
                    size: 60,
                    color: Colors.green[400],
                  ),
                  Icon(
                    Icons.live_tv,
                    size: 60,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.video_library,
                    size: 60,
                    color: Colors.green[400],
                  ),
                  Icon(
                    Icons.contact_phone,
                    size: 60,
                    color: Colors.green[400],
                  ),
                  Icon(
                    Icons.contact_mail,
                    size: 60,
                    color: Colors.green[400],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                height: 160,
                child: DrawerHeader(
                  child: Text(''),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/images/llm-logo.png"),
                          fit: BoxFit.fitWidth)),
                )),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.green[400],
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.green[400],
              ),
              title: Text(
                'About',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
              leading: Icon(
                Icons.live_tv,
                color: Colors.green[400],
              ),
              title: Text(
                'Live',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.video_library,
                color: Colors.green[400],
              ),
              title: Text(
                'Videos',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
                color: Colors.green[400],
              ),
              title: Text(
                'Prayer Request',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                color: Colors.green[400],
              ),
              title: Text(
                'Contact',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

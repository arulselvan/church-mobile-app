import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:llm_mobile_app/video_list.dart';
import './about.dart';
import './videos.dart';
import './contact.dart';
import './prayer-request.dart';
import './live.dart';
import './appDrawer.dart';

final List<String> imgList = [
  'http://llmchurch.org/images/llm-slider1.jpg',
  'http://llmchurch.org/images/llm-slider3.jpg',
  'http://llmchurch.org/images/llm-slider5.jpg',
];

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
                  image: AssetImage("assets/images/bg.png"))),
          /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green[400], Color(0xff982033)])),*/

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
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/images/about.png'),
                        color: null,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ), //`Icon` to display
                      tooltip: 'About',
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/images/live.png'),
                        color: null,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ), //`Icon` to display
                      tooltip: 'Live',
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Live()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/images/videos.png'),
                        color: null,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ),
                      tooltip: 'Videos',
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideosGallary()),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/images/prayer.png'),
                        color: null,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ), //`Icon` to display
                      tooltip: 'Prayer',
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrayerRequest()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/images/contact.png'),
                        color: null,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      ), //`Icon` to display
                      tooltip: 'Contact',
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contact()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: AppDrawer());
  }
}

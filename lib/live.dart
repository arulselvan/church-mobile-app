import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './video_library/apikey.dart';
//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_media/webview_flutter.dart';

class Live extends StatelessWidget {
  /*getLiveVideoId() async {
    print('inside getLiveVideoId');
    try {
      Uri url = new Uri.https('www.googleapis.com', 'youtube/v3/search', {
        "key": "${apikey}",
        "part": "snippet",
        "maxResults": "2",
        "type": "video",
        "eventType": "completed"
      });

      print('url:${url}');
      var res = await http.get(url, headers: {"Accept": "application/json"});
      print('response');
      print(res);
      var jsonData = json.decode(res.body);
      print(jsonData);
    } catch (ex) {
      print(ex);
    }
    return 'bWpsphRaIr4';
  }*/

  Live() {
    //this.getLiveVideoId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live"),
      ),
      body: Container(
          child: WebView(
        initialUrl:
            'https://www.youtube.com/embed/live_stream?channel=UCSW0N3mrelM4fnspyJXkSkw',
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}

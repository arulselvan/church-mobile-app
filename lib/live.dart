import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './video_library/apikey.dart';
//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_media/webview_flutter.dart';

//Todo:Arul - webview open issue full screen https://github.com/flutter/flutter/issues/45464

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
            child: Stack(children: [
          WebView(
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            /*initialUrl: Uri.dataFromString(
                    '<html><body><iframe width="100%" height="100%" src="https://www.youtube.com/embed/live_stream?channel=UCSW0N3mrelM4fnspyJXkSkw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
                    mimeType: 'text/html')
                .toString(),*/
            initialUrl:
                'https://www.youtube.com/embed/live_stream?channel=UCSW0N3mrelM4fnspyJXkSkw&enablejsapi=1&showinfo=0&autoplay=true&fs=1&rel=0',
            /*initialUrl:
                'https://www.youtube.com/embed/bWpsphRaIr4?enablejsapi=1&showinfo=0&autoplay=true&fs=1&rel=0',
            */
            javascriptMode: JavascriptMode.unrestricted,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              color: Colors.transparent,
            ),
          ),
          /*Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )*/
        ])));
  }
}

import 'package:flutter/material.dart';

import 'package:llm_mobile_app/mixin.dart';
import 'package:llm_mobile_app/video_library/apikey.dart';
import 'package:llm_mobile_app/video_library/popup.dart';
import 'package:llm_mobile_app/youtube_api/youtube_api.dart';
//import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './video_library/apikey.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'NrtH3TrV-dw',
  flags: YoutubePlayerFlags(autoPlay: true),
);

class VideosGallary extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideosGallary>
    with ListPopupTap<VideosGallary> {
  TextEditingController textController;
  YoutubePlayerController videoController;
  YoutubeAPI _youtubeAPI;
  List<YT_API> _ytResults;
  List<VideoItem> videoItems;
  String videoId;
  String channelId = 'UCSW0N3mrelM4fnspyJXkSkw';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _youtubeAPI = YoutubeAPI(apikey, type: 'video', maxResults: 50);
    _ytResults = [];
    videoItems = [];
    callAPI("LLM Church");
  }

  Future<Null> callAPI(String query) async {
    if (videoItems.isNotEmpty) {
      videoItems.clear();
    }

    _ytResults = await _youtubeAPI.channel("UCSW0N3mrelM4fnspyJXkSkw");

    setState(() {
      for (YT_API result in _ytResults) {
        VideoItem item = VideoItem(
          api: result,
          listPopupTap: this,
        );
        videoItems.add(item);
      }
    });
  }

  Future<Null> callNextPage(String query) async {
    Object nextPageOptions = {
      "part": "snippet",
      "maxResults": "30",
      "key": "${apikey}",
      "type": "video",
      "pageToken": "${_youtubeAPI.nextPageToken}",
      'channelId': channelId,
    };

    Uri url = new Uri.https(
        "www.googleapis.com", "youtube/v3/search", nextPageOptions);

    var res = await http.get(url, headers: {"Accept": "application/json"});
    var jsonData = json.decode(res.body);

    if (jsonData['pageInfo']['totalResults'] == null) return;

    if (jsonData == null) return;

    _youtubeAPI.nextPageToken = jsonData['nextPageToken'];
    _youtubeAPI.prevPageToken = jsonData['prevPageToken'];
    _youtubeAPI.api.setNextPageToken(_youtubeAPI.nextPageToken);
    _youtubeAPI.api.setPrevPageToken(_youtubeAPI.prevPageToken);

    int total = jsonData['pageInfo']['totalResults'] <
            jsonData['pageInfo']['resultsPerPage']
        ? jsonData['pageInfo']['totalResults']
        : jsonData['pageInfo']['resultsPerPage'];

    _ytResults = [];
    for (int i = 0; i < total; i++) {
      _ytResults.add(new YT_API(jsonData['items'][i]));
    }
    _youtubeAPI.page++;
    if (total == 0) {
      return null;
    }
    //_ytResults = await _youtubeAPI.nextPage();

    setState(() {
      for (YT_API result in _ytResults) {
        VideoItem item = VideoItem(
          api: result,
          listPopupTap: this,
        );
        videoItems.add(item);
      }
    });
  }

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          callNextPage('q');
        }
      });

    return Scaffold(
        appBar: AppBar(
          title: Text("Videos"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(children: <Widget>[
              /*TextFormField(
                controller: textController,
                onFieldSubmitted: (String q) async {
                  await callAPI(q);
                  textController.clear();
                },
              ),*/
              Flexible(
                child: ListView.builder(
                  itemCount: videoItems.length,
                  itemBuilder: (_, int index) {
                    final widgetItem = (index + 1 == videoItems.length)
                        ? new RaisedButton(
                            child: const Text('Load more...'),
                            onPressed: () => callNextPage('q'))
                        : videoItems[index];
                    return widgetItem;
                  },
                ),
              )
            ]))
          ],
        ));
  }

  @override
  void onTap(YT_API apiItem, BuildContext context) {
    setState(() {
      videoId = apiItem.id;
    });

    Navigator.of(context)
        .push(PopupVideoPlayerRoute(child: PopupVideoPlayer(videoId: videoId)));
  }
}

class VideoItem extends StatelessWidget {
  final YT_API api;
  final ListPopupTap listPopupTap;

  const VideoItem({Key key, this.api, this.listPopupTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: Image.network(api.thumbnail["high"]["url"]),
      title: Text(api.title),
      subtitle: Text(api.channelTitle),
      onTap: () {
        listPopupTap.onTap(api, context);
      },
    ));
  }
}

/*
class VideosGallary extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideosGallary> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('TEST'));
  }
}*/

import 'package:flutter/material.dart';
import 'package:llm_mobile_app/mixin.dart';
import 'package:llm_mobile_app/video_library/apikey.dart';
import 'package:llm_mobile_app/video_library/popup.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import './video_library/apikey.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Videos"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(children: <Widget>[
              TextFormField(
                controller: textController,
                onFieldSubmitted: (String q) async {
                  await callAPI(q);
                  textController.clear();
                },
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: videoItems.length,
                  itemBuilder: (_, int index) => videoItems[index],
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

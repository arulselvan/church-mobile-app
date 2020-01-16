import 'package:flutter/material.dart';

import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/*
import 'package:llm_mobile_app/mixin.dart';
import "package:llm_mobile_app/apikey.dart";
import 'package:llm_mobile_app/popup.dart';
*/

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'NrtH3TrV-dw',
  flags: YoutubePlayerFlags(autoPlay: true),
);

class VideosGallary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
              playedColor: Colors.amber, handleColor: Colors.amberAccent),
          onReady: () {
            _controller.play();
          },
        ),
      ),
    );
  }
}

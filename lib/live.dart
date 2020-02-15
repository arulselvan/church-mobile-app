import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Live extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: "9vzd289Eedk",
            flags: YoutubePlayerFlags(autoPlay: true, isLive: true),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}

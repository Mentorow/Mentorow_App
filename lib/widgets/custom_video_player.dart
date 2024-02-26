import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.pause();
                });
              },
              child: Icon(
                Icons.pause,
                size: 50,
                color: Colors.white,
              ),
            );
          });
        } else if (_controller.value.position.inMilliseconds -
                _controller.value.duration.inMilliseconds <
            1) {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },
              child: Icon(
                Icons.play_arrow,
                size: 50,
                color: Colors.white,
              ),
            );
          });
        } else {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },
              child: Icon(
                Icons.play_arrow,
                size: 50,
                color: Colors.white,
              ),
            );
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            _controller,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          )
        ],
      ),
    );
  }
}

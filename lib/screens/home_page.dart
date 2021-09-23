import 'package:flutter/material.dart';
import 'package:test/screens/video_item.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<VideoPlayerController> videoList = [
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
  ];
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.width.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text('Video App'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              VideoItems.named(
                videoList: videoList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

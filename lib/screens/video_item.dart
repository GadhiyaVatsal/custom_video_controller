import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final List<VideoPlayerController> videoList;

  const VideoItems.named({
    required this.videoList,
  });

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  var sliderTime = 0.0;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoList[0],
      aspectRatio: 8 / 5,
      autoInitialize: true,
      autoPlay: false,
      looping: false,
      showControls: false,
      showControlsOnInitialize: true,
      // showOptions: true,
      errorBuilder: (context, mes) {
        return Center(
          child: Text(mes),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.videoList.length,
            itemBuilder: (context, index) {
              _chewieController = ChewieController(
                videoPlayerController: widget.videoList[index],
                aspectRatio: 8 / 5,
                autoInitialize: true,
                showControls: false,
                errorBuilder: (context, mes) {
                  return Center(
                    child: Text(mes),
                  );
                },
              );
              return Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          ValueListenableBuilder(
              valueListenable: _chewieController.videoPlayerController,
              builder: (context, VideoPlayerValue value, child) {
                if (value.position == value.duration) {
                  _chewieController.seekTo(const Duration(milliseconds: 0));
                  //_chewieController.videoPlayerController.initialize();
                }

                //checking duration length
                var durMinLength = value.duration.inMinutes.toInt() < 10;
                var durSecLength = (value.duration.inSeconds.toInt() % 60) < 10;
                var durMin = durMinLength
                    ? '0${value.duration.inMinutes}'
                    : '${value.duration.inMinutes}';
                var durSec = durSecLength
                    ? '0${value.duration.inSeconds}'
                    : '${value.duration.inSeconds}';

                //checking current position length

                var posMinLength = value.position.inMinutes.toInt() < 10;
                var posSecLength = (value.position.inSeconds.toInt() % 60) < 10;
                var posMin = posMinLength
                    ? '0${value.position.inMinutes}'
                    : '${value.position.inMinutes}';
                var posSec = posSecLength
                    ? '0${value.position.inSeconds}'
                    : '${value.position.inSeconds}';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        '$posMin:$posSec / $durMin:$durSec',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5),
                      ),
                      child: Slider(
                        value: value.position == value.duration
                            ? 0
                            : value.position.inMilliseconds.toDouble(),
                        min: 0,
                        max: value.duration.inMilliseconds.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            _chewieController
                                .seekTo(Duration(milliseconds: val.toInt()));
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _chewieController.seekTo(Duration(
                                  seconds: value.position.inSeconds - 2));
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: const Icon(
                              Icons.replay_5,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            if (_chewieController.isPlaying ||
                                value.position == value.duration) {
                              setState(() {
                                _chewieController.pause();
                              });
                            } else {
                              setState(() {
                                _chewieController.play();
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: _chewieController.isPlaying
                                ? const Icon(
                                    Icons.pause,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                  ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _chewieController.seekTo(Duration(
                                  seconds: value.position.inSeconds + 2));
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child: const Icon(
                              Icons.forward_5,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
          // PlayerControl(),
        ],
      ),
    );
  }
}

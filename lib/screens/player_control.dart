import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/control/my_video.dart';

class PlayerControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Controls(
            icon: Icons.repeat,
          ),
          const Controls(
            icon: Icons.skip_previous,
          ),
          //PlayControl(),
          const Controls(
            icon: Icons.skip_next,
          ),
          const Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    );
  }
}

class PlayControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyVideo>(
      builder: (_, myVidewModel, child) => GestureDetector(
        onTap: () {
          myVidewModel.audioState == "Playing"
              ? myVidewModel.pauseVideo()
              : myVidewModel.playVideo();
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xffedd3cb),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff6f3d2e).withOpacity(0.5),
                  offset: Offset(5, 10),
                  spreadRadius: 3,
                  blurRadius: 10),
              const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-3, -4),
                  spreadRadius: -2,
                  blurRadius: 20)
            ],
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Color(0xff6f3d2e),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff6f3d2e).withOpacity(0.5),
                            offset: Offset(5, 10),
                            spreadRadius: 3,
                            blurRadius: 10),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3, -4),
                            spreadRadius: -2,
                            blurRadius: 20)
                      ]),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xffedd3cb), shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    myVidewModel.audioState == "Playing"
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 50,
                    color: Color(0xff6f3d2e),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Color(0xffedd3cb),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Color(0xff6f3d2e).withOpacity(0.5),
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff6f3d2e).withOpacity(0.5),
                        offset: Offset(5, 10),
                        spreadRadius: 3,
                        blurRadius: 10),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 20)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xffedd3cb), shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                icon,
                size: 30,
                color: Color(0xff6f3d2e),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

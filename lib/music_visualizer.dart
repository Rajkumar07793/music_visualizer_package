library music_visualizer;

import 'dart:async';
import "package:flutter/material.dart";
import 'package:flutter/animation.dart';

class MusicVisualizer extends StatelessWidget {
  final List<Color> colors;

  ///list of colors for bars
  final List<int> duration;

  ///list of duration for bars to animate
  final barCount;

  ///number of bar counts
  // final StreamController<bool> streamController;

  ///to control the animation
  MusicVisualizer(
      {Key key,
      @required this.colors,
      @required this.duration,
      @required this.barCount,
      // @required this.streamController
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: new List<Widget>.generate(
            barCount,
            (index) => VisualComponent(
                // stream: streamController.stream,
                duration: duration[index % 5],
                color: colors[index % 4])));
  }
}

class VisualComponent extends StatefulWidget {
  final int duration;
  final Color color;
  // final Stream<bool> stream;

  const VisualComponent(
      {Key key,
      @required this.duration,
      @required this.color,
      // @required this.stream
      })
      : super(key: key);

  @override
  _VisualComponentState createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // widget.stream.asBroadcastStream().listen((bool isPlay) {
    //   if(isPlay) {
    //     if(mounted) animationController.repeat(reverse: true);
    //   } else {
    //     if(mounted)animationController.reset();
    //   }
    // });
    animate();
  }

  @override
  void dispose() {
    animation..removeListener(() {});
    animation..removeStatusListener((status) {});
    animationController.stop();
    animationController.reset();
    animationController.dispose();
    super.dispose();
  }

  void animate() {
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInQuad);
    animation = Tween<double>(begin: 0, end: 50).animate(curvedAnimation)
      ..addListener(() {
        update();
      });
    animationController.repeat(reverse: true);
  }

  void update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: animation.value,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(5)),
    );
  }
}

library music_visualizer;

import "package:flutter/material.dart";

class MusicVisualizer extends StatelessWidget {
  final List<Color>? colors;
  final List<int>? duration;
  final int? barCount;
  final Curve? curve;

  const MusicVisualizer({
    Key? key,
    @required this.colors,
    @required this.duration,
    @required this.barCount,
    this.curve = Curves.easeInQuad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            barCount!,
            (index) => VisualComponent(
                curve: curve!,
                duration: duration![index % 5],
                color: colors![index % 4])));
  }
}

class VisualComponent extends StatefulWidget {
  final int duration;
  final Color color;
  final Curve curve;

  const VisualComponent(
      {Key? key,
      required this.duration,
      required this.color,
      required this.curve})
      : super(key: key);

  @override
  _VisualComponentState createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    );

    _animation = Tween<double>(begin: 0, end: 50).animate(curvedAnimation)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: _animation.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_visualizer/music_visualizer.dart';

StreamController<bool> streamController = StreamController<bool>.broadcast();

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Color> colors = [
    Colors.red[900],
    Colors.green[900],
    Colors.blue[900],
    Colors.brown[900]
  ];

  final List<int> duration = [900, 700, 600, 800, 500];

  @override
  void initState() {
    super.initState();
    streamController.add(true);///for animation start
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: MusicVisualizer(
          barCount: 30,
          colors: colors,
          duration: duration,
          // streamController: streamController,
        ),
      ),
    );
  }
}

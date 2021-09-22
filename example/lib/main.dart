import 'package:flutter/material.dart';
import 'package:music_visualizer/music_visualizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Color> colors = [
    Colors.red[900],
    Colors.green[900],
    Colors.blue[900],
    Colors.brown[900]
  ];

  final List<int> duration = [900, 700, 600, 800, 500];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Visualizer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicVisualizer(
        barCount: 30,
        colors: colors,
        duration: duration,
      ),
    );
  }
}
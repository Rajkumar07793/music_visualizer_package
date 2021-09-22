# visualizer_example

A new Flutter project.

## Getting Started

### Show some :heart: and star the repo to support the project

## Screenshots
<img src="https://raw.githubusercontent.com/Rajkumar07793/music_visualizer_package/22-09-2021_null-safety/visualCrop.gif"/>

# Example

```dart

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

```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

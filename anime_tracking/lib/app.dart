import 'package:flutter/material.dart';
import 'scenes/anime/anime_list.dart';

class AnimeTrackingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Anime List',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new AnimeList(),
    );
  }
}
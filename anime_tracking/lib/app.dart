import 'package:flutter/material.dart';
import 'scenes/anime/anime_list.dart';

class AnimeTrackingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new AnimeListPage(title: 'Flutter Demo Home Page'),
    );
  }
}
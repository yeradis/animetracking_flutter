import 'package:flutter/material.dart';
import 'routes.dart';

class AnimeTrackingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Anime List',
      theme:  new ThemeData(
        brightness: Brightness.light,
        platform: Theme.of(context).platform,
      ),
      routes: RoutesBuilder.routes,
    );
  }
}

import 'package:flutter/material.dart';
import '../scenes/anime/anime_list.dart';

import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    // onTap launch the page associated with the 'routeName'
    // see app.dart, there the routes are declared and linked to the route path
    // this one
    // routes: {
    //    AnimeList.routeName: (BuildContext context) => new AnimeList(),
    // },
    final Widget itemList = new ListTile(
      dense: true,
      title: const Text('Browse existing'),
      onTap: () => Navigator.popAndPushNamed(context, AnimeList.routeName),
    );

    final Widget itemAbout = new ListTile(
      dense: true,
      title: const Text('About'),
      onTap: () => launch('http://www.yeradis.com'),
    );

    return new Drawer(
        child: new ListView(
            children: <Widget>[_createHeader(),itemList, itemAbout]
        )
    );
  }

  Widget _createHeader() {
    return new DrawerHeader(
        padding: const EdgeInsets.all(0.0),
        decoration: new BoxDecoration(color: Colors.white),
        child: new Stack(children: <Widget>[
          new Image.asset('lib/assets/drawer_header_background.png', fit: BoxFit.fitWidth),
          new Positioned(
              bottom: 12.0,
              left: 16.0,
              child: new Text("Anime Tracking",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300))),
          new GestureDetector(
              onTap: () =>
              launch('http://www.yeradis.com')
          )
        ]));
  }

}
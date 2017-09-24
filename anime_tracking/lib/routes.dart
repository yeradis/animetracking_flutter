import 'package:flutter/material.dart';
import 'scenes/anime/anime_list.dart';

class RoutesBuilder {
  /**
   * single slash value in the route means that route is HOME
   */
  static Map<String, WidgetBuilder> get routes =>  {
      '/': (BuildContext context) => new AnimeList(),
      '/favorites': (BuildContext context) => new AnimeList(),
      '/watching': (BuildContext context) => new AnimeList()
  };

  static Widget buildPage(BuildContext context, Widget child) {
    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          platform: Theme
              .of(context)
              .platform,
        ),
        child: child
    );
  }
}

class AppRoute<T> extends MaterialPageRoute<T> {
  AppRoute({
    WidgetBuilder builder,
    RouteSettings settings: const RouteSettings()
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return RoutesBuilder.buildPage(context, super.buildPage(context, animation, secondaryAnimation));
  }

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}
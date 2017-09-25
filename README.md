# Anime Tracking

A simple [Flutter](https://flutter.io) app

>>see screenshots at the bottom
>>magic happens at [lib/](animetracking_flutter/anime_tracking/lib/) folder

Right now, this simple app can:

- Load/re-load a list from (internet | mock data)
- Show details for the selected item 
  this view its using Slivers... making it easy to have a flexible navigation bar where to cover image turns into the classic navigation bar while scrolling
- Navigation drawer menu (very ugly) with some options and a clickable header

Current data is a mocked one, because of an existing value, the `trick` happens at [anime_data_injection.dart](/anime_tracking/lib/data/anime_data_injection.dart)

Current repository data source settings is available at [main.dart](/anime_tracking/lib/main.dart) in this way:

```dart
  AnimeListInjector.configure(Origin.MOCK);
```

There are two views, but one of them is using the Flutter's `routing` and `navigation` feature.

Maybe in other update will add the details here too using parameters at the route

See at [routes.dart](/anime_tracking/lib/routes.dart), something like:

```dart
    static Map<String, WidgetBuilder> get routes =>  {
        '/': (BuildContext context) => new AnimeList(),
        '/favorites': (BuildContext context) => new AnimeList(),
        '/watching': (BuildContext context) => new AnimeList()
    };
},
```

Then,`Browse existing` action at menu, is defined in this way:

```dart
final Widget itemList = new ListTile(
      dense: true,
      title: const Text('Browse existing'),
      onTap: () => Navigator.popAndPushNamed(context, AnimeList.routeName),
    );
```

where `Navigator.popAndPushNamed(context, AnimeList.routeName)` call the corresponding view

Also there, you will see something like:

```dart
launch('http://www.yeradis.com')
``` 

This is using and external dependency declared in [pubspec.yaml](/anime_tracking/pubspec.yaml)

```yaml
dependencies:
  url_launcher: ^0.4.0
```

The header image in the menu, its also declared there

```yaml
 assets:
    - lib/assets/drawer_header_background.png
```

![list](/screenshots/shot1.png)

![details](/screenshots/shot3.png)

![menu](/screenshots/shot2.png)

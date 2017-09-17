# Anime Tracking

A simple [Flutter](https://flutter.io) app

>>see screenshots at the bottom

Right now, this simple add can:

- Load a list from (internet | mock data)
- Select and remove items from the list
- Navigation drawer menu with a clickable header

Current data is a mocked one, because of an existing value, the `trick` happens at [nime_data_injection.dart](/anime_tracking/lib/data/anime_data_injection.dart)

Current repository settings is available at [main.dart](/anime_tracking/lib/main.dart) in this way:

```dart
  AnimeListInjector.configure(Origin.MOCK);
```

There is only one view, but its using the Flutter's `routing` and `navigation` feature.

See at [app.dart](/anime_tracking/lib/app.dart), something like:

```dart
routes: {
    AnimeList.routeName: (BuildContext context) => new AnimeList(),
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
![menu](/screenshots/shot2.png)

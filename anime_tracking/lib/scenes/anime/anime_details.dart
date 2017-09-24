import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/anime_data.dart';

import '../../widget/details/detail_category.dart';
import '../../widget/details/detail_item.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class AnimeDetails extends StatefulWidget {
  const AnimeDetails(
      {
        Key key,
        @required this.anime,
      }): assert(anime != null),
          super(key: key);

  final Anime anime;

  static const String routeName = '/details';
  @override
  _AnimeDetailsState createState() => new _AnimeDetailsState(anime: anime);
}

class _AnimeDetailsState extends State<AnimeDetails> {
   _AnimeDetailsState(
      {
        @required this.anime,
      }): assert(anime != null),
        super();

  final Anime anime;

  GlobalKey<ScaffoldState> _scaffoldKey;
  final double _appBarHeight = 400.0;

   bool _inFavorites = false;
   bool _inPlaylist = false;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = new GlobalKey<ScaffoldState>(debugLabel: 'Anime details ${widget.anime}');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        platform: Theme.of(context).platform,
      ),
      child: new Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                _buttonFavorites,
                _buttonPlaylist,
              ],
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text(anime.name),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _cover(height: _appBarHeight),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: const <Color>[
                            Colors.black26,
                            Colors.black87
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                plotSection,
                new Container(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: new Text(
                      "Info",
                      softWrap: true,
                      style: themeData.textTheme.title,
                )),
                new DetailCategory(
                  icon: Icons.chevron_right,
                  children: <Widget>[
                    new DetailItem(
                      lines: <String>[
                        '009 Re:Cyborg',
                        'Main Title',
                      ],
                    ),
                    new DetailItem(
                      icon: Icons.flag,
                      verified: true,
                      lines: <String>[
                        '009 RE:CYBORG',
                        'Official Title - Japan',
                      ],
                    ),
                    new DetailItem(
                      icon: Icons.flag,
                      verified: true,
                      lines: <String>[
                        '009 Re:Cyborg',
                        'Official Title - UK',
                      ],
                    ),
                    new DetailItem(
                      icon: Icons.flag,
                      lines: <String>[
                        '009 Re:Cyborg',
                        'Official Title - Germany',
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

   Widget _cover({double height}) {
     NetworkImage networkImage = new NetworkImage(anime.cover);
     Image coverImage =
     new Image(image: networkImage, height: height, fit: BoxFit.cover);
     return coverImage;
   }

   Widget get plotSection => new Container(
     padding: const EdgeInsets.all(32.0),
     child: new Text(
       anime.plot,
       softWrap: true,
     ),
   );

   Widget get _buttonFavorites =>
       new IconButton(
         icon: _inFavorites ? const Icon(Icons.favorite) : const Icon(
             Icons.favorite_border),
         tooltip: 'Add to favorites',
         onPressed: () {
           _scaffoldKey.currentState.showSnackBar(const SnackBar(
               content: const Text('Added to favorites')
           ));
         },
       );

   IconButton get _buttonPlaylist =>
       new IconButton(
         icon: _inPlaylist ? const Icon(Icons.playlist_add_check)  : const Icon(Icons.playlist_add),
         tooltip: 'Add to watch list',
         onPressed: () {
           _scaffoldKey.currentState.showSnackBar(const SnackBar(
               content: const Text('Added to watch list')
           ));
         },
       );
}

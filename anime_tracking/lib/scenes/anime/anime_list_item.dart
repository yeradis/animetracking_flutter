import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../data/anime_data.dart';
import '../../routes.dart';
import 'anime_details.dart';

class AnimeListItem extends StatelessWidget {
   AnimeListItem(
      {Key key,
      @required this.animation,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final Anime item;
  final bool selected;
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            _handleTap(context);
          },
          child: new SizedBox(
            height: 190.0,
            child: new Card(
              color: Colors.white,
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return new Container(
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_coverSection, _detailsSection],
      ),
    );
  }

  Widget get _detailsSection =>
      new Container(
        margin: const EdgeInsets.all(10.0),
        child: new Row(
          children: [
            _titleAndSummary,
            new Container(width: 5.0),
            _rating(),
          ],
        ),
      );

  Widget _rating() {
    return new Row(
      children: <Widget>[
        new Icon(
          Icons.star,
          color: Colors.redAccent,
        ),
        new Text(item.rating)
      ],
    );
  }

  Widget get _coverSection =>
      new Row(children: <Widget>[
        new Expanded(
          child: _cover(height: 110.0),
          flex: 1,
        ),
      ]);


  Widget get _titleAndSummary =>
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title,
            _plot,
          ],
        ),
      );

  Widget _cover({double height}) {
    NetworkImage networkImage = new NetworkImage(item.cover);
    Image coverImage =
        new Image(image: networkImage, height: height, fit: BoxFit.cover);
    return coverImage;
  }

  Widget get _title => new Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: new Text(
        item.name,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  Widget get _plot => new Text(
      item.plot,
      maxLines: 2,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: new TextStyle(
        color: Colors.grey,
      ),
    );

  void _handleTap(BuildContext context) {
    Navigator.push(context, new AppRoute(
      builder: (BuildContext context) => new AnimeDetails(anime: item),
    ));
  }
}

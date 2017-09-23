import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../data/anime_data.dart';

class AnimeListItem extends StatelessWidget {
  const AnimeListItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final Anime item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
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
        children: <Widget>[_coverSection(), _detailsSection()],
      ),
    );
  }

  Widget _detailsSection() {
    return new Container(
      margin: const EdgeInsets.all(10.0),
      child: new Row(
        children: [
          _titleAndSummary(),
          new Container(width: 5.0),
          _rating(),
        ],
      ),
    );
  }

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

  Widget _coverSection() {
    return new Row(children: <Widget>[
      new Expanded(
        child: _cover(height: 110.0),
        flex: 1,
      ),
    ]);
  }

  Widget _titleAndSummary() {
    return new Expanded(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _summary(),
        ],
      ),
    );
  }

  Widget _cover({double height}) {
    NetworkImage networkImage = new NetworkImage(item.cover);
    Image coverImage =
        new Image(image: networkImage, height: height, fit: BoxFit.cover);
    return coverImage;
  }

  Widget _title() {
    return new Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: new Text(
        item.name,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _summary() {
    return new Text(
      item.plot,
      style: new TextStyle(
        color: Colors.grey,
      ),
    );
  }
}

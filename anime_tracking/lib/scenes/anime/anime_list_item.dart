import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../data/anime_data.dart';

class AnimeListItem extends StatelessWidget {
  const AnimeListItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false
  }) : assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final Anime item;
  final bool selected;

  @override
  Widget build(BuildContext context) {

    NetworkImage networkImage = new NetworkImage(item.cover);

    Image coverImage = new Image(image: networkImage,
      height: 128.0,fit: BoxFit.fitWidth);

    Container title = new Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: new Text(
        item.name,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Text subtitle = new Text(
      item.plot,
      style: new TextStyle(
        color: Colors.grey,
      ),
    );

    Row infoSection = new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                subtitle,
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.redAccent,
          ),
          new Text(item.rating),
        ],
      );

    ListView content = new ListView(
      children: [
        coverImage,
        new Container(
          margin: const EdgeInsets.all(8.0),
          child: infoSection,
          ),
      ],
    );

    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightBlueAccent);
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
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
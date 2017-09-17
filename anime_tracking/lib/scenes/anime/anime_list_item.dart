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

    Image coverSection = new Image.asset(
      'lib/assets/drawer_header_background.png',
      height: 128.0,
      fit: BoxFit.fitWidth,
    );

    Row titleSection = new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    item.name,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  item.plot,
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text(item.rating),
        ],
      );

    ListView content = new ListView(
      children: [
        coverSection,
        titleSection
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
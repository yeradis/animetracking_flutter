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
            height: 128.0,
            child: new Card(
              color: Colors.white,
              child: new Center(
                child: new Text(item.name, style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
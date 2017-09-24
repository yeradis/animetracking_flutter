import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  DetailItem({
    Key key,
    this.icon,
    this.verified = false,
    this.lines})
      : assert(lines.length > 1),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => new Text(line)).toList();
    columnChildren.add(new Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren
          )
      )
    ];

    if (verified) {
      rowChildren.add(new SizedBox(
          width: 32.0,
          child: new Icon(Icons.check,color: themeData.primaryColor)
      ));
    }

    if (icon != null) {
      rowChildren.add(new SizedBox(
          width: 44.0,
          child: new Icon(icon,color: themeData.primaryColor)
      ));
    }

    return new MergeSemantics(
      child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: new Row(
              children: rowChildren
          )
      ),
    );
  }
}
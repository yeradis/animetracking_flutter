import 'package:flutter/material.dart';

class DetailCategory extends StatelessWidget {
  const DetailCategory({ Key key, this.icon, this.children }) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(color: themeData.dividerColor))
        ),
        child: new DefaultTextStyle(
            style: Theme.of(context).textTheme.subhead,
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      width: 32.0,
                      child: new Icon(icon, color: themeData.primaryColor)
                  ),
                  new Expanded(child: new Column(children: children))
                ]
            )
        )
    );
  }
}
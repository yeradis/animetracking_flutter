import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/anime_data.dart';
import 'anime_list_presenter.dart';
import 'anime_list_item.dart';

import '../../widget/navigation_drawer.dart';

class AnimeList extends StatefulWidget {
  static const String routeName = '/';

  @override
  _AnimeListState createState() => new _AnimeListState();
}

class _AnimeListState extends State<AnimeList>  with TickerProviderStateMixin implements AnimeListViewContract {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();

  ListModel<Anime> _list;
  Anime _selectedItem;
  AnimeListPresenter _presenter;

  _AnimeListState() {
    _presenter = new AnimeListPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    _list = new ListModel<Anime>(
      listKey: _listKey,
      initialItems: <Anime>[],
      removedItemBuilder: _buildRemovedItem,
    );

    _presenter.loadAnimeList();
  }

  @override
  void onLoadAnimeListComplete(List<Anime> items) {
    setState(() {
      _list.clear();
      items.forEach((anime) => _list.insert(_list.length, anime));
    });
  }

  @override
  void onLoadAnimeListError() {
    print("error while fetching the anime list");
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return new AnimeListItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(Anime item, BuildContext context, Animation<double> animation) {
    return new AnimeListItem(
      animation: new AnimationController(
          duration: new Duration(seconds: 0), vsync: this),
      item: item,
      selected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Remove the selected item from the list model.
  void _reloadList() {
    _presenter.loadAnimeList();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
            title: const Text('Anime list'),
            actions: <Widget>[
              new IconButton(
                icon: const Icon(Icons.update),
                onPressed: _reloadList,
                tooltip: 'Reload list',
              ),
            ]),
        drawer: new NavigationDrawer(),
        body: body,
      ),
    );
  }

  Padding get body => new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
      );
}

/// Keeps a Dart List in sync with an AnimatedList.
///
/// The [insert] and [removeAt] methods apply to both the internal list and the
/// animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that mutate the
/// list must make the same changes to the animated list in terms of
/// [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })
      : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  void remove(E item) {
    if (item != null) {
      var index = _items.indexOf(item);
      if (_items.remove(item)) {
        _animatedList.removeItem(index,
            (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(item, context, animation);
        });
      }
    }
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);

  void clear() {
    //first lets get a copy before removing to avoid
    //Concurrent modification during iteration errors
    var toRemove = _items.toList();
    toRemove.forEach((item) => remove(item));
  }
}

import '../../data/anime_data.dart';
import '../../data/anime_data_repository.dart';
import '../../data/anime_data_injection.dart';

abstract class AnimeListViewContract {
  void onLoadAnimeListComplete(List<Anime> items);

  void onLoadAnimeListError();
}

class AnimeListPresenter {
  AnimeListViewContract _view;
  AnimeRepository _repository;

  AnimeListPresenter(this._view) {
    _repository = new AnimeListInjector().animeRepository;
  }

  void loadAnimeList() {
    assert(_view != null);
    _repository
        .fetch()
        .then((animeList) => _view.onLoadAnimeListComplete(animeList))
        .catchError((onError) {
      print(onError);
      _view.onLoadAnimeListError();
    });
  }
}

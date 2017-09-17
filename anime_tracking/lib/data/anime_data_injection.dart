import '../data/anime_data_repository.dart';
import '../data/anime_data_impl.dart';
import '../data/anime_data_mock.dart';

enum Origin {
  MOCK,
  PROD
}

class AnimeListInjector {
  static final AnimeListInjector _singleton = new AnimeListInjector._internal();
  static Origin _origin;

  static void configure(Origin origin) {
    _origin = origin;
  }

  factory AnimeListInjector() {
    return _singleton;
  }

  AnimeListInjector._internal();

  AnimeRepository get animeRepository {
    switch(_origin) {
      case Origin.MOCK: return new MockAnimeListRepository();
      default:
        return new AnimeListRepository();
    }
  }
}
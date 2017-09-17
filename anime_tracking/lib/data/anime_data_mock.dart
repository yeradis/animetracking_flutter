import 'dart:async';

import 'anime_data.dart';
import 'anime_data_repository.dart';

class MockAnimeListRepository implements AnimeRepository{

  Future<List<Anime>> fetch(){
    return new Future.value(kAnimeList);
  }

}

const kAnimeList = const <Anime>[
  const Anime(
      id: '8699',
      name : '009 Re:Cyborg',
      type: 'Movie',
      plot: 'Nine regular humans from different parts....',
      cover: 'https://img7.anidb.net/pics/anime/126644.jpg',
      tags: 'action, angel, cyborg, gunfights, human enhancement, manga, science fiction, shounen, super power, tragedy',
      rating: '4.69'
  ),
  const Anime(
      id: '10847',
      name : 'Baby Steps (2015)',
      type: 'Serie',
      plot: 'Maruo Eiichirou has begun his training...',
      cover: 'https://img7.anidb.net/pics/anime/167753.jpg',
      tags: 'manga, shounen, sports, tennis',
      rating: '7.68'
  ),
  const Anime(
      id: '12414',
      name : 'Berserk (Season 2)',
      type: 'Serie',
      plot: 'Spurred by the flame raging in his heart',
      cover: 'https://img7.anidb.net/pics/anime/198902.jpg',
      tags: 'dark fantasy, elf, fantasy, manga, seinen, tragedy, violence',
      rating: '5.65'
  )
];
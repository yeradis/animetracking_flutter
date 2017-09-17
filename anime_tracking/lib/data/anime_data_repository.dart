import 'dart:async';
import 'anime_data.dart';

abstract class AnimeRepository {
  Future<List<Anime>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
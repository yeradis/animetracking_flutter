import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'anime_data.dart';
import 'anime_data_repository.dart';

class AnimeListRepository implements AnimeRepository {
  static const _kAnimeEndpointUrl = 'http://yeradis.com/animelist.json';
  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<Anime>> fetch() {
    return http.get(_kAnimeEndpointUrl).then((http.Response response) {
      abortOnInvalidResponse(response);

      final container = _decoder.convert(response.body);
      final List items = container['results'];

      return items.map((raw) => new Anime.fromMap(raw)).toList();
    });
  }

  abortOnInvalidResponse(http.Response response) {
    final String responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      throw new FetchDataException(
          "Error while getting anime list [StatusCode:$statusCode, Error:${response
              .reasonPhrase}]");
    }
  }
}

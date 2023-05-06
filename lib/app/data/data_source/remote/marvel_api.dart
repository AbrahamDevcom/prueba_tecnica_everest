import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:io';

import 'package:prueba_tecnica_everest/app/data/helpers/http_method.dart';
import 'package:prueba_tecnica_everest/app/utils/environment.dart';

import '../../../domain/responses/character_response.dart';
import '../../../domain/responses/comic_response.dart';
import '../../../domain/responses/events_response.dart';
import '../../../domain/responses/series_response.dart';
import '../../../domain/responses/stories_response.dart';
import '../../helpers/http.dart';

//Esta clase contiene los meetodos para interactuar con la api de Multired

class MarvelApi {
  final Http _http;
  MarvelApi(this._http);

  final publicKey = Environment.publicKeyApi;
  final privateKey = Environment.privateKeyApi;

  Future<CharactersResponse> fetchMarvelCharacters(int offset, int limit) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(ts, publicKey, privateKey);
    final apiUrl = 'characters?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await _http.request(
      apiUrl,
      method: HttpMethod.get,
      headers: {},
      body: {},
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      return CharactersResponse.createEmpty();
    }
    if (response.statusCode == HttpStatus.ok) {
      CharactersResponse responseData = CharactersResponse.fromJson(utf8.decode(response.bodyBytes));
      //final characterList = responseData.data.results;
      return responseData;
    } else {
      throw Exception('Error al cargar los personajes de Marvel');
    }
  }

  Future<ComicsResponse> fetchMarvelComics(int charactersID, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(ts, publicKey, privateKey);
    const limit = 20;
    final apiUrl = 'characters/$charactersID/comics?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await _http.request(
      apiUrl,
      method: HttpMethod.get,
      headers: {},
      body: {},
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      return ComicsResponse.createEmpty();
    }
    if (response.statusCode == HttpStatus.ok) {
      ComicsResponse responseData = ComicsResponse.fromJson(utf8.decode(response.bodyBytes));
      //final characterList = responseData.data.results;
      return responseData;
    } else {
      throw Exception('Error al cargar los personajes de Marvel');
    }
  }

  Future<EventsResponse> fetchMarvelEvents(int charactersID, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(ts, publicKey, privateKey);
    const limit = 20;
    final apiUrl = 'characters/$charactersID/events?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await _http.request(
      apiUrl,
      method: HttpMethod.get,
      headers: {},
      body: {},
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      return EventsResponse.createEmpty();
    }
    if (response.statusCode == HttpStatus.ok) {
      EventsResponse responseData = EventsResponse.fromJson(utf8.decode(response.bodyBytes));
      //final characterList = responseData.data.results;
      return responseData;
    } else {
      throw Exception('Error al cargar los personajes de Marvel');
    }
  }

  Future<SeriesResponse> fetchMarvelSeries(int charactersID, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(ts, publicKey, privateKey);
    const limit = 20;
    final apiUrl = 'characters/$charactersID/series?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await _http.request(
      apiUrl,
      method: HttpMethod.get,
      headers: {},
      body: {},
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      return SeriesResponse.createEmpty();
    }
    if (response.statusCode == HttpStatus.ok) {
      SeriesResponse responseData = SeriesResponse.fromJson(utf8.decode(response.bodyBytes));
      //final characterList = responseData.data.results;
      return responseData;
    } else {
      throw Exception('Error al cargar los personajes de Marvel');
    }
  }

  Future<StoriesResponse> fetchMarvelStories(int charactersID, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = generateHash(ts, publicKey, privateKey);
    const limit = 20;
    final apiUrl = 'characters/$charactersID/stories?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await _http.request(
      apiUrl,
      method: HttpMethod.get,
      headers: {},
      body: {},
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      return StoriesResponse.createEmpty();
    }
    if (response.statusCode == HttpStatus.ok) {
      StoriesResponse responseData = StoriesResponse.fromJson(utf8.decode(response.bodyBytes));
      //final characterList = responseData.data.results;
      return responseData;
    } else {
      throw Exception('Error al cargar las Historias de Marvel');
    }
  }

  String generateHash(String ts, String publicKey, String privateKey) {
    final bytes = utf8.encode('$ts$privateKey$publicKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../../domain/repositories/global_features_repository.dart';
import '../../../../domain/responses/comic_response.dart' as comic_response;
import '../../../../domain/responses/events_response.dart';
import '../../../../domain/responses/series_response.dart';
import '../../../../domain/responses/stories_response.dart' as stories_response;

class CharacterDetailViewModel extends ChangeNotifier {
  CharacterDetailViewModel({required this.api});
  final GlobalFeaturesRepository api;
  //final int characterId;

  int offset = 0;
  int limit = 20;
  bool isLoading = false;
  List<comic_response.Comics> listComics = [];
  List<Events> listEvents = [];
  List<Series> listSeries = [];
  List<stories_response.Stories> listStories = [];

  void init(id) {
    fetchMarvelComics(id, offset);
    fetchMarvelEvents(id, offset);
    fetchMarvelSeries(id, offset);
    fetchMarvelStories(id, offset);
  }

  void fetchMarvelComics(int charactersID, int offset) async {
    isLoading = false;
    final response = await api.getMarvelComics(charactersID, offset);
    log(response.data.results.toString());
    listComics = response.data.results;
    //listComics.add(response.data.results);
    notifyListeners();
  }

  void fetchMarvelEvents(int charactersID, int offset) async {
    isLoading = false;
    final response = await api.getMarvelEvents(charactersID, offset);
    listEvents = response.data.results;
    notifyListeners();
  }

  void fetchMarvelSeries(int charactersID, int offset) async {
    isLoading = false;
    final response = await api.getMarvelSeries(charactersID, offset);
    listSeries = response.data.results;
    notifyListeners();
  }

  void fetchMarvelStories(int charactersID, int offset) async {
    isLoading = false;
    final response = await api.getMarvelStories(charactersID, offset);
    listStories = response.data.results;
    notifyListeners();
  }
}

import '../../domain/repositories/global_features_repository.dart';
import '../../domain/responses/character_response.dart';
import '../../domain/responses/comic_response.dart';
import '../../domain/responses/events_response.dart';
import '../../domain/responses/series_response.dart';
import '../../domain/responses/stories_response.dart';
import '../data_source/remote/marvel_api.dart';

class GlobalFeaturesRepositoryImpl extends GlobalFeaturesRepository {
  final MarvelApi _marvelApi;

  GlobalFeaturesRepositoryImpl(this._marvelApi);

  @override
  Future<CharactersResponse> getCharacters(offset, limit) => _marvelApi.fetchMarvelCharacters(offset, limit);
  @override
  Future<ComicsResponse> getMarvelComics(charactersID, offset) => _marvelApi.fetchMarvelComics(charactersID, offset);
  @override
  Future<EventsResponse> getMarvelEvents(charactersID, offset) => _marvelApi.fetchMarvelEvents(charactersID, offset);
  @override
  Future<SeriesResponse> getMarvelSeries(charactersID, offset) => _marvelApi.fetchMarvelSeries(charactersID, offset);
  @override
  Future<StoriesResponse> getMarvelStories(charactersID, offset) => _marvelApi.fetchMarvelStories(charactersID, offset);
}

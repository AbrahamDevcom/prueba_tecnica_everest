import '../responses/character_response.dart';
import '../responses/comic_response.dart';
import '../responses/events_response.dart';
import '../responses/series_response.dart';
import '../responses/stories_response.dart';

abstract class GlobalFeaturesRepository {
  Future<CharactersResponse> getCharacters(int offset, int limit);
  Future<ComicsResponse> getMarvelComics(int charactersID, int offset);
  Future<EventsResponse> getMarvelEvents(int charactersID, int offset);
  Future<SeriesResponse> getMarvelSeries(int charactersID, int offset);
  Future<StoriesResponse> getMarvelStories(int charactersID, int offset);
}

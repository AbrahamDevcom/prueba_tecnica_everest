import 'package:prueba_tecnica_everest/app/data/data_source/remote/marvel_api.dart';

import 'data/helpers/http.dart';
import 'package:get_it/get_it.dart';
import 'constants.dart';
import 'data/repositories_impl/global_features_repository_impl.dart';
import 'domain/repositories/global_features_repository.dart';

final GetIt locator = GetIt.instance;

Future<void> injectDependecies() async {
  final http = Http();
  //final authClient = AuthenticationClient(const FlutterSecureStorage());

  locator.registerFactory<GlobalFeaturesRepository>(() => GlobalFeaturesRepositoryImpl(MarvelApi(http)));
}

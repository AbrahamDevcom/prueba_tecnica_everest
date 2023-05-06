import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../domain/repositories/global_features_repository.dart';
import '../../inject.dart';
import '../pages/character_detail/character_detail_page.dart';
import '../pages/character_detail/viewModel/character_detail.viewmodel.dart';
import '../pages/home/home_page.dart';
import '../pages/home/viewModel/home.viewmodel.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get getAppicationRoutes => {
        HomePage.routeName: (_) => const HomePage(),
        CharacterDetailPage.routeName: (_) => const CharacterDetailPage(
              characterID: null,
            ),
      };

  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (_) => HomeViewModel(api: locator<GlobalFeaturesRepository>())),
        ChangeNotifierProvider(create: (_) => CharacterDetailViewModel(api: locator<GlobalFeaturesRepository>()))
      ];
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_everest/app/domain/repositories/global_features_repository.dart';

import '../../../../domain/responses/character_response.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.api,
  }) {
    init();
  }

  int offset = 0;
  int limit = 20;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<Result> listCharacters = [];
  final GlobalFeaturesRepository api;

  Future<void> fetchAllCharacters() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    final response = await api.getCharacters(offset, limit);
    listCharacters.addAll(response.data.results);
    offset += limit;
    isLoading = false;
    notifyListeners();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      fetchAllCharacters();
    }
  }

  // Future<void> _loadCharacters() async {
  //   if (isLoading) {
  //     return;
  //   }
  //   isLoading = true;
  //   final response = await api.getCharacters(offset, limit);
  //   listCharacters.addAll(response.data.results);
  //   offset += limit;
  //   isLoading = false;
  // }

  void init() {
    fetchAllCharacters();
    scrollController.addListener(_scrollListener);
  }
}

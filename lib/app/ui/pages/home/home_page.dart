import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_everest/app/ui/pages/home/viewModel/home.viewmodel.dart';

import '../../../domain/responses/character_response.dart';
import '../../../utils/utils.dart';
import '../character_detail/character_detail_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFC141C),
        title: Image.asset(
          "assets/logo/Marvel-Comics-logo.png",
          height: 60,
        ),
      ),
      body: ListView.builder(
        controller: provider.scrollController,
        itemCount: provider.listCharacters.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == provider.listCharacters.length) {
            return provider.isLoading ? Center(child: const CircularProgressIndicator()) : const SizedBox();
          }
          final Result character = provider.listCharacters[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                title: Text(character.name),
                subtitle: Text(character.description.isEmpty ? "Not description available" : character.description),
                leading: Image.network(
                  '${character.thumbnail.path}/portrait_medium.${character.thumbnail.extension}',
                  height: 150,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CharacterDetailPage(
                        characterID: character,
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          );
        },
        // onEndReached: _loadCharacters,
      ),
    );
  }
}

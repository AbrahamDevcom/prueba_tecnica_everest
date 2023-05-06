import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_everest/app/utils/utils.dart';
import '../../../domain/responses/character_response.dart' as character_arg;
import '../../../domain/responses/comic_response.dart' as comic_response;
import '../../../domain/responses/events_response.dart';
import '../../../domain/responses/series_response.dart';
import '../../../domain/responses/stories_response.dart' as stories_response;
import '../../theme/colors_theme.dart';
import 'viewModel/character_detail.viewmodel.dart';

class CharacterDetailPage extends StatefulWidget {
  static const String routeName = "character_detail";
  final character_arg.Result? characterID;
  const CharacterDetailPage({Key? key, required this.characterID}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CharacterDetailViewModel>(context, listen: false).init(widget.characterID!.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    character_arg.Result character = widget.characterID!;
    final provider = Provider.of<CharacterDetailViewModel>(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsTheme.marvelColor,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorsTheme.white,
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: const BoxDecoration(
                      color: ColorsTheme.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: Text(character.name, style: Utils.negrillas()))),
              ),
              pinned: true,
              backgroundColor: ColorsTheme.white,
              expandedHeight: 350,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                stretchModes: const [StretchMode.zoomBackground],
                background: Image.network(
                  '${character.thumbnail.path}/portrait_incredible.${character.thumbnail.extension}',
                  fit: BoxFit.cover,
                  //height: 150,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Material(
                color: ColorsTheme.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        character.description.isEmpty ? "Not description available" : character.description,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Comics",
                            style: TextStyle(color: ColorsTheme.amber, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomListHorizontal(
                        listDefined: provider.listComics,
                        provider: provider,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Events",
                            style: TextStyle(color: ColorsTheme.amber, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomListHorizontal(
                        listDefined: provider.listEvents,
                        provider: provider,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Series",
                            style: TextStyle(color: ColorsTheme.amber, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomListHorizontal(
                        listDefined: provider.listSeries,
                        provider: provider,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Stories",
                            style: TextStyle(color: ColorsTheme.amber, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomListHorizontal(
                        listDefined: provider.listStories,
                        provider: provider,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListHorizontal extends StatelessWidget {
  const CustomListHorizontal({
    super.key,
    required this.listDefined,
    required this.provider,
  });

  final CharacterDetailViewModel provider;
  final List<dynamic> listDefined;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: listDefined.isEmpty ? 30 : 200,
      child: listDefined.isEmpty
          ? const Center(
              child: Text("Data not found"),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listDefined.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == listDefined.length) {
                  return provider.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox();
                }

                final data = listDefined[index];
                return Container(
                  margin: const EdgeInsets.only(right: 8, bottom: 4, left: 4, top: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 1), // changes position of shadow
                    )
                  ]),
                  width: 140,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      data.thumbnail?.path == null
                          ? Image.asset('assets/logo/Marvel-Comics-logo.png')
                          : Image.network('${data.thumbnail?.path}/portrait_medium.${data.thumbnail?.extension}'),
                      Expanded(
                          child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: ColorsTheme.black, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                );
              },
            ),
    );
  }
}

import 'package:character_project/model/hero_adapter_model.dart';

import 'package:flutter/material.dart';

import '../../model/hero_list_model.dart';
import '../detail/hero_detail_page.dart';
import 'adapter/hero_adapter.dart';

class HeroListPage extends StatelessWidget {
  final List<HeroListModel> heroes;

  HeroListPage({required this.heroes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: constraints.maxWidth * 0.5,
                  mainAxisExtent: constraints.maxHeight * 0.3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12),
              itemBuilder: (BuildContext context, int index) {
                return HeroAdapter(
                  key: Key('Item$index'),
                  heroAdapterModel: HeroAdapterModel.parse(heroes[index]),
                  reservedHeight: constraints.maxHeight * 0.3,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return HeroDetailPage(
                            selectedHero: heroes[index],
                          );
                        }));
                  },
                );
              });
        },
      ),
    );
  }
}

import 'package:character_project/bloc/hero_cubit.dart';
import 'package:character_project/bloc/hero_state.dart';
import 'package:character_project/helpers/hero_list_sort_helper.dart';
import 'package:character_project/model/hero_list_model.dart';
import 'package:character_project/pages/detail/components/character_stats_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroDetailPage extends StatelessWidget {
  final HeroListModel selectedHero;

  final HeroListSortHelper _heroListSortHelper = HeroListSortHelper();

  HeroDetailPage({
    required this.selectedHero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedHero.name,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            Image.network(selectedHero.imageUrl),
        CharacterStatsComponents(
          selectedHero: selectedHero,
        ),
            BlocBuilder<HeroCubit, HeroState>(
              bloc: BlocProvider.of<HeroCubit>(context),
              builder: (BuildContext context, HeroState state) {
                List<HeroListModel> topThreeSimilar =
                    _heroListSortHelper.getSimilarHeroes(
                  allHeroes: state.heroes,
                  attribute: selectedHero.primaryAttribute.keys.first,
                  heroId: selectedHero.id,
                );
                return Column(
                  children: [
                    InkWell(
                      child: Ink(
                        child: Image.network(topThreeSimilar[0].imageUrl),
                      ),
                      onTap: () {
                        _goToSimilarHeroDetail(context, topThreeSimilar[0]);
                      },
                    ),
                    InkWell(
                      child: Ink(
                        child: Image.network(topThreeSimilar[1].imageUrl),
                      ),
                      onTap: () {
                        _goToSimilarHeroDetail(context, topThreeSimilar[1]);
                      },
                    ),
                    InkWell(
                      child: Ink(
                        child: Image.network(topThreeSimilar[2].imageUrl),
                      ),
                      onTap: () {
                        _goToSimilarHeroDetail(context, topThreeSimilar[2]);
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _goToSimilarHeroDetail(
      BuildContext context, HeroListModel selectedSimilarHero) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HeroDetailPage(
        selectedHero: selectedSimilarHero,
      );
    }));
  }
}

import 'package:character_project/model/hero_list_model.dart';
import 'package:flutter/material.dart';

import '../../../atom/clipped_image.dart';

class SimilarCharactersComponent extends StatelessWidget {

  final Function(int) onSimilarHeroesTapped;

  final List<HeroListModel> topThreeSimilar;

  const SimilarCharactersComponent({Key? key, required this.onSimilarHeroesTapped, required this.topThreeSimilar}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Text(
              'Similar Heroes',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 8),
            child: InkWell(
              child: Ink(
                child: ClippedImage(
                  width: MediaQuery.of(context).size.width,
                  heroName: topThreeSimilar[0].name,
                  imageUrl: topThreeSimilar[0].imageUrl,
                ),
              ),
              onTap: () {
                onSimilarHeroesTapped(0);
                //_goToSimilarHeroDetail(context, topThreeSimilar[0]);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 8),
            child: InkWell(
              child: Ink(
                child: ClippedImage(
                  width: MediaQuery.of(context).size.width,
                  heroName: topThreeSimilar[1].name,
                  imageUrl: topThreeSimilar[1].imageUrl,
                ),
              ),
              onTap: () {
                onSimilarHeroesTapped(1);
                //_goToSimilarHeroDetail(context, topThreeSimilar[1]);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 8),
            child: InkWell(
              child: Ink(
                child: ClippedImage(
                  width: MediaQuery.of(context).size.width,
                  heroName: topThreeSimilar[2].name,
                  imageUrl: topThreeSimilar[2].imageUrl,
                ),
              ),
              onTap: () {
                onSimilarHeroesTapped(2);
                //_goToSimilarHeroDetail(context, topThreeSimilar[2]);
              },
            ),
          ),
        ],
      ),
    );
  }

}
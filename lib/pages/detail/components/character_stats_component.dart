import 'package:character_project/model/hero_list_model.dart';
import 'package:flutter/material.dart';

class CharacterStatsComponents extends StatelessWidget {
  final HeroListModel selectedHero;

  const CharacterStatsComponents({Key? key, required this.selectedHero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Type'),
                Text(
                  selectedHero.type,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Column(
              children: [
                const Text('Max Attack'),
                Text(
                  '${selectedHero.baseAttackMin} - ${selectedHero.baseAttackMax}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Column(
              children: [
                const Text('Health'),
                Text(
                  selectedHero.baseHealth.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Column(
              children: [
                const Text('MSPD'),
                Text(
                  selectedHero.movementSpeed.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Column(
              children: [
                const Text('Attr'),
                Text(
                  selectedHero.primaryAttribute.values.first,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

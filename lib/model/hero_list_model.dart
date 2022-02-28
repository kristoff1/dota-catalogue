import 'package:character_project/api/data/heroes_data.dart';
import 'package:character_project/constants.dart';

import '../global/hero_attribute_enum.dart';

class HeroListModel {
  final int id;

  final String name;

  final String imageUrl;

  late List<String> categories;

  late Map<HeroPrimaryAttribute, String> primaryAttribute;

  final int baseAttackMax;

  final int baseAttackMin;

  final int baseHealth;

  final int movementSpeed;

  final int agilityPoints;

  final int strengthPoints;

  final int intelligentPoints;

  final String type;

  Map<HeroPrimaryAttribute, String> getHeroPrimaryAttribute(
      String primaryAttribute) {
    if (primaryAttribute == 'int') {
      return {HeroPrimaryAttribute.int: 'Int'};
    } else if (primaryAttribute == 'str') {
      return {HeroPrimaryAttribute.str: 'Str'};
    } else if (primaryAttribute == 'agi') {
      return {HeroPrimaryAttribute.agi: 'Agi'};
    }
    return {HeroPrimaryAttribute.undefined: 'N/A'};
  }

  HeroListModel(
    this.id,
    this.name,
    this.imageUrl,
    this.categories,
    this.primaryAttribute,
    this.baseAttackMax,
    this.baseHealth,
    this.movementSpeed,
    this.agilityPoints,
    this.strengthPoints,
    this.intelligentPoints,
    this.type,
    this.baseAttackMin,
  );

  HeroListModel.parse(HeroesData hero)
      : id = hero.id ?? 0,
        name = hero.localizedName ?? '',
        baseAttackMax = hero.baseAttackMax?.toInt() ?? 0,
        baseHealth = hero.baseHealth?.toInt() ?? 0,
        movementSpeed = hero.moveSpeed?.toInt() ?? 0,
        categories = hero.roles ?? [roleList.last],
        agilityPoints = hero.baseAgi?.toInt() ?? 0,
        intelligentPoints = hero.baseInt?.toInt() ?? 0,
        strengthPoints = hero.baseStr?.toInt() ?? 0,
        type = hero.attackType ?? '',
        baseAttackMin = hero.baseAttackMin?.toInt() ?? 0,
        imageUrl = '$baseUrl${hero.img}' {
    primaryAttribute = getHeroPrimaryAttribute(hero.primaryAttr ?? '');
  }
}

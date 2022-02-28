import '../global/hero_attribute_enum.dart';
import '../model/hero_list_model.dart';

class HeroListSortHelper {
  List<HeroListModel> getSimilarHeroes({
    required List<HeroListModel> allHeroes,
    required int heroId,
    required HeroPrimaryAttribute attribute,
  }) {
    List<HeroListModel> heroesWithSimilarAttributes =
        allHeroes.where((HeroListModel model) {
      return model.primaryAttribute.keys.first == attribute &&
          model.id != heroId;
    }).toList();

    heroesWithSimilarAttributes.sort((b, a) =>
        _valueToCompare(attribute, a).compareTo(_valueToCompare(attribute, b)));

    return heroesWithSimilarAttributes.getRange(0, 3).toList();
  }

  int _valueToCompare(
      HeroPrimaryAttribute attribute, HeroListModel modelToCompare) {
    if (attribute == HeroPrimaryAttribute.int) {
      return modelToCompare.intelligentPoints;
    } else if (attribute == HeroPrimaryAttribute.agi) {
      return modelToCompare.agilityPoints;
    } else {
      return modelToCompare.strengthPoints;
    }
  }
}

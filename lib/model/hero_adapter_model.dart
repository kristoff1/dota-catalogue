import 'package:character_project/model/hero_list_model.dart';

import '../global/hero_roles_enum.dart';

class HeroAdapterModel {
  final String imageUrl;

  final String name;

  late String tags;

  late String attribute;

  HeroAdapterModel(this.imageUrl, this.name, this.tags, this.attribute);

  HeroAdapterModel.parse(HeroListModel model)
      : name = model.name,
        imageUrl = model.imageUrl {
    tags = model.categories.join(', ');
    attribute = model.primaryAttribute.values.first;
  }

  String generateTags(List<Map<HeroRoles, String>> tags) {
    return tags
        .map((Map<HeroRoles, String> roles) {
          return roles.values;
        })
        .toList()
        .join(', ');
  }
}

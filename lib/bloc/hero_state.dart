import 'package:character_project/model/hero_list_model.dart';

class HeroState {

  final List<HeroListModel> heroes;

  String? errorMessage;

  HeroState({required this.heroes, this.errorMessage = ''});
}
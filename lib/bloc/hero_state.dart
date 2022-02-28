import 'package:character_project/model/hero_list_model.dart';

abstract class HeroState {}

class HeroLoadedState extends HeroState{

  final List<HeroListModel> heroes;

  HeroLoadedState({required this.heroes});

}

class LoadingState extends HeroState {
  LoadingState();
}

class ErrorLoadingState extends HeroState {

  final String errorMessage;

  ErrorLoadingState({required this.errorMessage});
}
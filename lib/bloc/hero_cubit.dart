import 'package:character_project/bloc/hero_state.dart';
import 'package:character_project/pages/home/service/heroes_service.dart';
import 'package:either_option/either_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/hero_list_model.dart';

class HeroCubit extends Cubit<HeroState> {
  HeroCubit(initialState) : super(initialState);

  void getAllHeroes(HeroesService service) async {
    Either<String, List<HeroListModel>> result = await service.fetchHeroes();
    result.fold((String errorMessage) {
      emit(HeroState(heroes: [], errorMessage: errorMessage));
    }, (List<HeroListModel> result) {
      emit(HeroState(heroes: result));
    });
  }
}

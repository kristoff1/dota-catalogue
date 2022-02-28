import 'package:character_project/bloc/hero_cubit.dart';
import 'package:character_project/bloc/hero_state.dart';
import 'package:character_project/pages/home/service/heroes_service.dart';
import 'package:character_project/pages/universal/errors/error_view.dart';
import 'package:character_project/pages/universal/loading/loading_view.dart';
import 'package:character_project/util/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../model/hero_list_model.dart';
import 'hero_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<HeroCubit>(context).getAllHeroes(
      HeroesService(
          api: InheritedInjection.of(context).api,
          network: InheritedInjection.of(context).network),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 9,
        child: BlocBuilder<HeroCubit, HeroState>(
            bloc: BlocProvider.of<HeroCubit>(context),
            builder: (BuildContext context, HeroState state) {
              if (state.heroes.isEmpty &&
                  state.errorMessage != null &&
                  state.errorMessage!.isEmpty) {
                return const LoadingView();
              } else if (state.errorMessage != null &&
                  state.errorMessage!.isNotEmpty) {
                return ErrorView(
                    errorMessage: state.errorMessage ?? 'Unknown Error',
                    onRetry: () {
                      BlocProvider.of<HeroCubit>(context).getAllHeroes(
                        HeroesService(
                            api: InheritedInjection.of(context).api,
                            network: InheritedInjection.of(context).network),
                      );
                    });
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text('DOTA'),
                  centerTitle: true,
                  bottom: TabBar(
                      isScrollable: true,
                      tabs: roleList.map((String tabTitle) {
                        return Tab(
                          text: tabTitle,
                        );
                      }).toList()),
                ),
                body: TabBarView(
                  children: [
                    HeroListPage(heroes: state.heroes),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[1]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[2]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[3]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[4]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[5]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[6]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[7]);
                    }).toList()),
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                      return models.categories.contains(roleList[8]);
                    }).toList()),
                  ],
                ),
              );
            }));
  }
}

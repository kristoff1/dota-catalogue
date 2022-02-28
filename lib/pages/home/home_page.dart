import 'package:character_project/bloc/hero_cubit.dart';
import 'package:character_project/bloc/hero_state.dart';
import 'package:character_project/pages/home/service/heroes_service.dart';
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
    // TODO: implement didChangeDependencies
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
        length: 10,
        child: BlocBuilder<HeroCubit, HeroState>(
            bloc: BlocProvider.of<HeroCubit>(context),
            builder: (BuildContext context, HeroState state) {
              if (state.heroes.isEmpty) {
                return Scaffold(
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HeroCubit>(context).getAllHeroes(
                          HeroesService(
                              api: InheritedInjection.of(context).api,
                              network: InheritedInjection.of(context).network),
                        );
                      },
                      child: Text('Retry'),
                    ),
                  ),
                );
              } else if (state.errorMessage != null &&
                  state.errorMessage!.isNotEmpty) {
                return Center(
                  child: Text('Error'),
                );
              }
              return Scaffold(
                appBar: AppBar(
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
                    HeroListPage(
                        heroes: state.heroes.where((HeroListModel models) {
                          return models.categories.contains(roleList[9]);
                        }).toList()),
                  ],
                ),
              );
            }));
  }
}

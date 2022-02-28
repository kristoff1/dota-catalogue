import 'package:character_project/bloc/hero_cubit.dart';
import 'package:character_project/bloc/hero_state.dart';
import 'package:character_project/pages/home/home_page.dart';
import 'package:character_project/theme.dart';
import 'package:character_project/util/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InheritedInjection(
      child: BlocProvider(
        create: (BuildContext context) => HeroCubit(LoadingState()),
        child: MaterialApp(
          title: 'DOTA Catalogue',
          theme: DotaTheme.heroesTheme,
          home: HomePage(),
        ),
      ),
    );
  }
}

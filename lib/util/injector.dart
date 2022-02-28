import 'package:character_project/api/heroes_api.dart';
import 'package:character_project/pages/home/service/heroes_service.dart';
import 'package:character_project/helpers/network_helper.dart';
import 'package:flutter/material.dart';

class InheritedInjection extends InheritedWidget {
  InheritedInjection({required this.child}) : super(child: child);

  final Widget child;

  final HeroesApi api = HeroesApi();

  final NetworkHelper network = NetworkHelper();

  static InheritedInjection of(BuildContext context) {
    final InheritedInjection? result = (context.dependOnInheritedWidgetOfExactType<InheritedInjection>());
    assert(result != null, 'No Injection found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}
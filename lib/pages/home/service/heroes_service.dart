import 'dart:convert';

import 'package:character_project/model/hero_list_model.dart';
import 'package:either_option/either_option.dart';
import 'package:http/http.dart' as http;

import '../../../api/data/heroes_data.dart';
import '../../../api/heroes_api.dart';
import '../../../helpers/network_helper.dart';

class HeroesService {
  HeroesApi api;

  NetworkHelper network;

  HeroesService({required this.api, required this.network});

  Future<Either<String, List<HeroListModel>>> fetchHeroes() async {
    http.Response response = await api.getMusicList(network);
    switch(response.statusCode) {
      case 200:
        List<HeroListModel> modelList =
        HeroesDataList.fromJson(jsonDecode(response.body))
            .heroes!
            .map((HeroesData data) {
          return HeroListModel.parse(data);
        }).toList();

        ///TODO add cases for network errors and stuffs
        if (modelList.isNotEmpty) {
          return Right(modelList);
        } else {
          return Left('Found No Data');
        }
      case 404: return Left('Page not Found');
      case 500:
      default:
        return Left('Error Connecting to Server');
    }

  }
}

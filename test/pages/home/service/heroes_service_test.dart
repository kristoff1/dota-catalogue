import 'dart:convert';
import 'dart:io';

import 'package:character_project/api/data/heroes_data.dart';
import 'package:character_project/api/heroes_api.dart';
import 'package:character_project/helpers/network_helper.dart';
import 'package:character_project/model/hero_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'heroes_service_test.mocks.dart';

@GenerateMocks([HeroesApi, NetworkHelper])
void main() {
  group('parseData', () {
    HeroesApi api = MockHeroesApi();
    NetworkHelper helper = MockNetworkHelper();

    setUp(() async {
      File testJson = File('assets/jsons/test_json.json');
      final testResponse = await testJson.readAsString();
      when(api.getMusicList(helper))
          .thenAnswer((_) async => http.Response(testResponse, 200));
    });

    test('Check if Heroes Data is not null', () async {
      http.Response response = await api.getMusicList(helper);
      expect(
          HeroesDataList.fromJson(jsonDecode(response.body)).heroes, isNotNull);
    });

    test('Check if Heroes Data is correct type', () async {
      http.Response response = await api.getMusicList(helper);
      expect(HeroesDataList.fromJson(jsonDecode(response.body)).heroes,
          isA<List<dynamic>>());
    });

    test('Check if Heroes Data is not empty', () async {
      http.Response response = await api.getMusicList(helper);
      expect(HeroesDataList.fromJson(jsonDecode(response.body)).heroes,
          isNotEmpty);
    });

    test('Check if Heroes List Model is Not Null', () async {
      http.Response response = await api.getMusicList(helper);
      expect(
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
            return HeroListModel.parse(data);
          }).toList(),
          isNotNull);
    });

    test('Check if Heroes List Model is not empty', () async {
      http.Response response = await api.getMusicList(helper);
      expect(
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
            return HeroListModel.parse(data);
          }).toList(),
          isNotEmpty);
    });

    test('Check if Heroes List Model returns the correct type', () async {
      http.Response response = await api.getMusicList(helper);
      expect(
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
            return HeroListModel.parse(data);
          }).toList(),
          isA<List<HeroListModel>>());
    });

    test('Check if Heroes List Model returns essential data: Name', () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].name, isNotEmpty);
    });
    test('Check if Heroes List Model returns essential data: movementSpeed',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].movementSpeed, isNot(0));
    });
    test('Check if Heroes List Model returns the correct type: Image Url',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].imageUrl, isNotEmpty);
    });

    test('Check if Heroes List Model returns the correct type: Image Url',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].imageUrl, isNotEmpty);
    });

    test('Check if Heroes List Model returns the correct type: Roles',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].categories, isNotEmpty);
    });
    test('Check if Heroes List Model returns the correct type: Base Health',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].baseHealth, isNot(0));
    });
    test('Check if Heroes List Model returns the correct type: Attack Type',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].type, isNotEmpty);
    });
    test('Check if Heroes List Model returns the correct type: Strength Point',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].strengthPoints, isNot(0));
    });
    test(
        'Check if Heroes List Model returns the correct type: Intelligence Point',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].intelligentPoints, isNot(0));
    });
    test('Check if Heroes List Model returns the correct type: Agility Point',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].agilityPoints, isNot(0));
    });
    test('Check if Heroes List Model returns the correct type: Base Attack Min',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].baseAttackMin, isNot(0));
    });
    test('Check if Heroes List Model returns the correct type: Base Attack Max',
        () async {
      http.Response response = await api.getMusicList(helper);
      List<HeroListModel> modelList =
          HeroesDataList.fromJson(jsonDecode(response.body))
              .heroes!
              .map((HeroesData data) {
        return HeroListModel.parse(data);
      }).toList();
      expect(modelList[0].baseAttackMax, isNot(0));
    });
  });
}

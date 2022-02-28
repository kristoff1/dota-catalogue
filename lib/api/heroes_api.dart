import 'dart:async';
import 'dart:io';

import 'package:character_project/helpers/network_helper.dart';
import 'package:http/http.dart' as http;

class HeroesApi {
  Future<http.Response> getMusicList(
      NetworkHelper helper, HeroesApi api) async {
    try {
      http.Response response = await helper.networkGet(path: 'api/herostats');
      return response;
    } on SocketException catch (_) {
      return http.Response('Error Connecting to server', 500);
    } on TimeoutException catch (_) {
      return http.Response('Connection Timeout', 500);
    } on Exception catch (_) {
      return http.Response('Unknown Error', 500);
    }
  }
}

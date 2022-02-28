import 'package:character_project/helpers/network_helper.dart';
import 'package:http/http.dart' as http;

class HeroesApi {
  Future<http.Response> getMusicList(
      NetworkHelper helper, HeroesApi api) async {
    return helper.networkGet(path: 'api/herostats');
  }
}

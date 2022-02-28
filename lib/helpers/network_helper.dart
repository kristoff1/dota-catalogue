import 'package:character_project/constants.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper();

  Future<http.Response> networkGet({required String path, String? query}) {
    Uri uri = Uri(scheme: 'https', host: baseHost, path: path, query: query);
    return http.get(uri);
  }
}
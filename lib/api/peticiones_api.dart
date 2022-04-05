import 'package:get/get.dart';

//https://ghibliapi.herokuapp.com/films
class PeticionesApi extends GetConnect {
  Future<Response> httpGet(
      {required String url, Map<String, dynamic>? query}) async {
    final response = await get(url, query: query);
    return response;
  }
}

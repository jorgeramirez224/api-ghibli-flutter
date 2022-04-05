import 'package:apitest3/api/peticiones_api.dart';
import 'package:apitest3/models/api_model.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  @override
  void onInit() {
    obtenerApi();
    super.onInit();
  }

  final peticionesApi = Get.find<PeticionesApi>();
  bool cargando = false;
  List<ApiModel> film = [];
  List<ApiModel> filmSearch = [];
  late ApiModel films;

  //Obtener todos los datos de la API
  //final listaApi = response.body['films'];
  Future<void> obtenerApi() async {
    cargando = true;
    update();
    final response = await peticionesApi.httpGet(
        url: 'https://ghibliapi.herokuapp.com/films');
    final listaApi = (response.body);
    final listaApiModel = List<ApiModel>.from(
        listaApi.map((films) => ApiModel.fromJsonMap(films)));
    film.addAll(listaApiModel);
    cargando = false;
    update();
  }

  //Buscar un solo dato mediante el Search
  Future buscarApi(String query) async {
    final response = await peticionesApi.httpGet(
        url: 'https://ghibliapi.herokuapp.com/films', query: {'title': query});
    final listaApi = (response.body);
    final listaApiModel = List<ApiModel>.from(
      listaApi.map(
        (films) => ApiModel.fromJsonMap(films),
      ),
    );
    filmSearch = listaApiModel;
    update();
  }
}

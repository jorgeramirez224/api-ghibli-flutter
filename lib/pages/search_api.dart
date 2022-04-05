import 'package:apitest3/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilm extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Widgets al lado derecho del Appbar
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Widgets al lado izquierdo del Appbar
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Se ejecuta cada vez que tecleas en el Search
    Get.find<ApiController>().buscarApi(query);

    return GetBuilder<ApiController>(builder: (apiController) {
      return (query != '')
          ? ListView.builder(
              itemCount: apiController.filmSearch.length,
              itemBuilder: (context, i) {
                final films = apiController.filmSearch[i];
                return ListTile(
                  onTap: () {
                    apiController.films = films;
                    Navigator.pushNamed(context, '/detalles/films');
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(films.image!),
                  ),
                  title: Text(films.title!),
                  subtitle: Text(films.original_title_romanised!),
                );
              })
          : Container();
    });
  }
}

import 'package:apitest3/controllers/api_controller.dart';
import 'package:apitest3/pages/search_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Films - Studio Ghibli'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              tooltip: 'Buscar',
              onPressed: () {
                showSearch(context: context, delegate: SearchFilm());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: GetBuilder<ApiController>(
        builder: (apiController) {
          return (apiController.cargando == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  //apiController.film.length
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    final films = apiController.film[i];
                    return GestureDetector(
                      onTap: () {
                        apiController.films = films;
                        Navigator.pushNamed(context, '/detalles/films');
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://i.giphy.com/media/oKLNQQ6OIeSU8/giphy.gif')),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      films.title!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: -10,
                            child: FadeInImage(
                              fit: BoxFit.contain,
                              width: 90,
                              height: 150,
                              placeholder: const NetworkImage(
                                  'https://i.pinimg.com/originals/b5/71/95/b57195740555db2993f209e0b0ed9ae4.gif'),
                              image: NetworkImage(films.image!),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
        },
      ),
    );
  }
}

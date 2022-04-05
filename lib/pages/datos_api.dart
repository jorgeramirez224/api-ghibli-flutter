import 'package:apitest3/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatosApiPages extends StatelessWidget {
  DatosApiPages({Key? key}) : super(key: key);
  final apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Text(
                  apiController.films.title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
                width: double.infinity,
                height: 298,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(150)),
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(height: 125),
              Container(
                child: Text(
                  apiController.films.original_title!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  apiController.films.original_title_romanised!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Director: " + apiController.films.director!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Producer: " + apiController.films.producer!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Release Date: " + apiController.films.release_date!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  apiController.films.description!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      fontStyle: FontStyle.italic),
                ),
                alignment: Alignment.topRight,
              ),
            ],
          ),
          Positioned(
            bottom: 430,
            right: 15,
            child: Image.network(
              apiController.films.image!,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:apitest3/api/peticiones_api.dart';
import 'package:apitest3/controllers/api_controller.dart';
import 'package:apitest3/pages/datos_api.dart';
import 'package:apitest3/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => PeticionesApi());
  Get.lazyPut(() => ApiController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studio Ghibli Films',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detalles/films': (context) => DatosApiPages(),
      },
    );
  }
} 

      
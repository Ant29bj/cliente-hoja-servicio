import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proyecto_final/app/models/orden.dart';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

class OrdenRepository {
  Future<List<OrdenData>> getAllOrden() async {
    // final dio = Dio();
    // Response response = await dio
    //     .get('https://ms-servicio-hoja.onrender.com/hoja_servicio/all');
    var url = Uri.https('ms-servicio-hoja.onrender.com', '/hoja_servicio/all');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<OrdenData> ordenes =
          jsonData.map((json) => OrdenData.fromJson(json)).toList();
      return ordenes;
    } else {
      List<OrdenData> ordenes = [];
      return ordenes;
    }
  }

  // Future<void> createHoja(OrdenData ordendata) async {
  //   var urlPrueba =
  //       Uri.https('ms-servicio-hoja.onrender.com', '/hoja_servicio');
  //   var body = ordendata.toJson();
  //   print(body);

  //   try {
  //     var response = await http.post(urlPrueba, body: body);
  //     if (response.statusCode == 201) {
  //       print('Éxito');
  //     } else {
  //       print('Fallo: ${response.statusCode}');
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  void createHoja(OrdenData ordenData) async {
    final dio = Dio();
    String url = "https://ms-servicio-hoja.onrender.com/hoja_servicio";
    var body = ordenData.toJson();
    print(body);
    Response res = await dio
        .post(
      url,
      data: body,
      options: Options(headers: {"Content-Type": "application/json"}),
    )
        .catchError((err) {
      print('Error ${err}');
    });
  }
}

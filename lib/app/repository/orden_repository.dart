import 'dart:convert';

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
      throw Exception('Error al obtener las ordens');
    }
  }
}

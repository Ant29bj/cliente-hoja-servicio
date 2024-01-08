import 'dart:async';
import 'dart:convert';

import 'package:proyecto_final/app/models/orden.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class OrdenRepository {
  final dio = Dio();
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

  Future<List<OrdenData>> getAllOrdenes() async {
    final response = await dio
        .get('https://ms-servicio-hoja.onrender.com/hoja_servicio/all');

    List<dynamic> ordenes = response.data;
    ordenes.map((data) => print(data['empresa']));

    List<OrdenData> prueba = [];
    return prueba;
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
    String url = "http://localhost:8080/hoja_servicio";
    var body = ordenData.toJson();

    var prueba = {
      "empresa": ordenData.empresa,
      "zona": ordenData.zona,
      "agencia": ordenData.agencia,
      "horaInicio": ordenData.horaInicio,
      "horaTermino": ordenData.horaTermino,
      "noEquipo": ordenData.noEquipo,
      "noEquipoSerie": ordenData.noEquipoSerie,
      "noInventario": ordenData.noInventario,
      "preventivoCompleto": ordenData.preventivoCompleto,
      "correctivo": ordenData.correctivo,
      "verificarComunicacionMonitoreo":
          ordenData.verificarComunicacionMonitoreo,
      "verificarComunicacionSicom": ordenData.verificarComunicacionSicom,
      "preubasAceptacionBilletes": ordenData.preubasAceptacionBilletes,
      "preubasAceptacionBilletesDesc": ordenData.pruebasDispensadoBilletesDesc,
      "pruebasAceptadorMonedas": ordenData.pruebasAceptadorMonedas,
      "pruebasDispensadoMonedas": ordenData.pruebasDispensadoMonedas,
      "pruebasDispensadoMonedasDesc": " ",
      "preubasDispensadoBilletes": ordenData.preubasDispensadoBilletes,
      "pruebasDispensadoBilletesDesc": " ",
      "pruebasImpresion": ordenData.pruebasImpresion,
      "diagnosticoFallas": ordenData.diagnosticoFallas,
      "mantenimientoGabinete": ordenData.mantenimientoGabinete,
      "organizacionEstadoCableado": ordenData.organizacionEstadoCableado,
      "mantenimientoPc": ordenData.mantenimientoPc,
      "mantenimientoMonitor": ordenData.mantenimientoMonitor,
      "mantenimientoEscaner": ordenData.mantenimientoEscaner,
      "mantenimientoImpresora": ordenData.mantenimientoImpresora,
      "mantenimientoTarjetaInterfaz": ordenData.mantenimientoTarjetaInterfaz,
      "mantenimientoToneleros": ordenData.mantenimientoToneleros,
      "mantenimientoDispensadorBilletes":
          ordenData.mantenimientoDispensadorBilletes,
      "mantenimientoAceptadorBilletes":
          ordenData.mantenimientoAceptadorBilletes,
      "mantenimientoAceptadorMonedas": false,
      "ups": ordenData.ups.toJson(),
      "refaciones": [],
      "observaciones": ordenData.observaciones,
      "estadoVerificacionUltimaVersionLiberada":
          ordenData.estadoVerificacionUltimaVersionLiberada,
      "verificacionUltimaVersionLiberada":
          ordenData.verificacionUltimaVersionLiberada,
      "actualizacionAntivirusCorporativo":
          ordenData.actualizacionAntivirusCorporativo,
      "verificaFechaHora": ordenData.verificaFechaHora,
      "aceptaMantenimiento": ordenData.aceptaMantenimiento,
      "detalleServicio": ordenData.detalleServicio,
      "calidadServicio": ordenData.calidadServicio
    };
    print(prueba);
    Response res = await dio
        .post(
      url,
      data: prueba,
    )
        .catchError((err) {
      print('Error ${err}');
    });
  }
}

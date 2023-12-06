import 'dart:convert';

OrdenData ordenFromJson(String str) => OrdenData.fromJson(json.decode(str));

String ordenToJson(OrdenData data) => json.encode(data.toJson());

class OrdenData {
  int id;
  String noOrden;
  String zona;
  String empresa;
  String agencia;
  String fecha;
  String horaInicio;
  String horaTermino;
  String noEquipo;
  String noEquipoSerie;
  String noInventario;
  bool verificarComunicacionMonitoreo;
  bool verificarComunicacionSicom;
  bool preubasAceptacionBilletes;
  String preubasAceptacionBilletesDesc;
  bool pruebasDispensadoMonedas;
  dynamic pruebasDispensadoMonedasDesc;
  bool preubasDispensadoBilletes;
  String pruebasDispensadoBilletesDesc;
  bool pruebasImpresion;
  String diagnosticoFallas;
  bool mantenimientoGabinete;
  bool organizacionEstadoCableado;
  bool mantenimientoPc;
  bool mantenimientoMonitor;
  bool mantenimientoEscaner;
  bool mantenimientoImpresora;
  bool mantenimientoTarjetaInterfaz;
  bool mantenimientoToneleros;
  bool mantenimientoDispensadorBilletes;
  bool mantenimientoAceptadorBilletes;
  bool mantenimientoAceptadorMonedas;
  String verificacionUltimaVersionLiberada;
  bool actualizacionAntivirusCorporativo;
  bool verificaFechaHora;
  bool aceptaMantenimiento;
  String detalleServicio;
  String calidadServicio;

  OrdenData({
    required this.id,
    required this.noOrden,
    required this.zona,
    required this.empresa,
    required this.agencia,
    required this.fecha,
    required this.horaInicio,
    required this.horaTermino,
    required this.noEquipo,
    required this.noEquipoSerie,
    required this.noInventario,
    required this.verificarComunicacionMonitoreo,
    required this.verificarComunicacionSicom,
    required this.preubasAceptacionBilletes,
    required this.preubasAceptacionBilletesDesc,
    required this.pruebasDispensadoMonedas,
    required this.pruebasDispensadoMonedasDesc,
    required this.preubasDispensadoBilletes,
    required this.pruebasDispensadoBilletesDesc,
    required this.pruebasImpresion,
    required this.diagnosticoFallas,
    required this.mantenimientoGabinete,
    required this.organizacionEstadoCableado,
    required this.mantenimientoPc,
    required this.mantenimientoMonitor,
    required this.mantenimientoEscaner,
    required this.mantenimientoImpresora,
    required this.mantenimientoTarjetaInterfaz,
    required this.mantenimientoToneleros,
    required this.mantenimientoDispensadorBilletes,
    required this.mantenimientoAceptadorBilletes,
    required this.mantenimientoAceptadorMonedas,
    required this.verificacionUltimaVersionLiberada,
    required this.actualizacionAntivirusCorporativo,
    required this.verificaFechaHora,
    required this.aceptaMantenimiento,
    required this.detalleServicio,
    required this.calidadServicio,
  });

  factory OrdenData.fromJson(Map<String, dynamic> json) => OrdenData(
        id: json["id"],
        noOrden: json["noOrden"],
        zona: json["zona"],
        empresa: json["empresa"],
        agencia: json["agencia"],
        fecha: json["fecha"],
        horaInicio: json["horaInicio"],
        horaTermino: json["horaTermino"],
        noEquipo: json["noEquipo"],
        noEquipoSerie: json["noEquipoSerie"],
        noInventario: json["noInventario"],
        verificarComunicacionMonitoreo: json["verificarComunicacionMonitoreo"],
        verificarComunicacionSicom: json["verificarComunicacionSicom"],
        preubasAceptacionBilletes: json["preubasAceptacionBilletes"],
        preubasAceptacionBilletesDesc: json["preubasAceptacionBilletesDesc"],
        pruebasDispensadoMonedas: json["pruebasDispensadoMonedas"],
        pruebasDispensadoMonedasDesc: json["pruebasDispensadoMonedasDesc"],
        preubasDispensadoBilletes: json["preubasDispensadoBilletes"],
        pruebasDispensadoBilletesDesc: json["pruebasDispensadoBilletesDesc"],
        pruebasImpresion: json["pruebasImpresion"],
        diagnosticoFallas: json["diagnosticoFallas"],
        mantenimientoGabinete: json["mantenimientoGabinete"],
        organizacionEstadoCableado: json["organizacionEstadoCableado"],
        mantenimientoPc: json["mantenimientoPc"],
        mantenimientoMonitor: json["mantenimientoMonitor"],
        mantenimientoEscaner: json["mantenimientoEscaner"],
        mantenimientoImpresora: json["mantenimientoImpresora"],
        mantenimientoTarjetaInterfaz: json["mantenimientoTarjetaInterfaz"],
        mantenimientoToneleros: json["mantenimientoToneleros"],
        mantenimientoDispensadorBilletes:
            json["mantenimientoDispensadorBilletes"],
        mantenimientoAceptadorBilletes: json["mantenimientoAceptadorBilletes"],
        mantenimientoAceptadorMonedas: json["mantenimientoAceptadorMonedas"],
        verificacionUltimaVersionLiberada:
            json["verificacionUltimaVersionLiberada"],
        actualizacionAntivirusCorporativo:
            json["actualizacionAntivirusCorporativo"],
        verificaFechaHora: json["verificaFechaHora"],
        aceptaMantenimiento: json["aceptaMantenimiento"],
        detalleServicio: json["detalleServicio"],
        calidadServicio: json["calidadServicio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "noOrden": noOrden,
        "zona": zona,
        "empresa": empresa,
        "agencia": agencia,
        "fecha": fecha,
        "horaInicio": horaInicio,
        "horaTermino": horaTermino,
        "noEquipo": noEquipo,
        "noEquipoSerie": noEquipoSerie,
        "noInventario": noInventario,
        "verificarComunicacionMonitoreo": verificarComunicacionMonitoreo,
        "verificarComunicacionSicom": verificarComunicacionSicom,
        "preubasAceptacionBilletes": preubasAceptacionBilletes,
        "preubasAceptacionBilletesDesc": preubasAceptacionBilletesDesc,
        "pruebasDispensadoMonedas": pruebasDispensadoMonedas,
        "pruebasDispensadoMonedasDesc": pruebasDispensadoMonedasDesc,
        "preubasDispensadoBilletes": preubasDispensadoBilletes,
        "pruebasDispensadoBilletesDesc": pruebasDispensadoBilletesDesc,
        "pruebasImpresion": pruebasImpresion,
        "diagnosticoFallas": diagnosticoFallas,
        "mantenimientoGabinete": mantenimientoGabinete,
        "organizacionEstadoCableado": organizacionEstadoCableado,
        "mantenimientoPc": mantenimientoPc,
        "mantenimientoMonitor": mantenimientoMonitor,
        "mantenimientoEscaner": mantenimientoEscaner,
        "mantenimientoImpresora": mantenimientoImpresora,
        "mantenimientoTarjetaInterfaz": mantenimientoTarjetaInterfaz,
        "mantenimientoToneleros": mantenimientoToneleros,
        "mantenimientoDispensadorBilletes": mantenimientoDispensadorBilletes,
        "mantenimientoAceptadorBilletes": mantenimientoAceptadorBilletes,
        "mantenimientoAceptadorMonedas": mantenimientoAceptadorMonedas,
        "verificacionUltimaVersionLiberada": verificacionUltimaVersionLiberada,
        "actualizacionAntivirusCorporativo": actualizacionAntivirusCorporativo,
        "verificaFechaHora": verificaFechaHora,
        "aceptaMantenimiento": aceptaMantenimiento,
        "detalleServicio": detalleServicio,
        "calidadServicio": calidadServicio,
      };
}

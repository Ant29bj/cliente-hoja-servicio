import 'dart:convert';

OrdenData ordenFromJson(String str) => OrdenData.fromJson(json.decode(str));

String ordenToJson(OrdenData data) => json.encode(data.toJson());

class OrdenData {
  String noOrden;
  String empresa;
  String zona;
  String agencia;
  DateTime fecha;
  String horaInicio;
  String horaTermino;
  String noEquipo;
  String noEquipoSerie;
  String noInventario;
  bool preventivoCompleto;
  bool correctivo;
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
  Ups ups;
  List<Refacione> refaciones;
  String observaciones;
  // bool estadoUltimaVerificacionLiberada;
  String verificacionUltimaVersionLiberada;
  bool actualizacionAntivirusCorporativo;
  bool verificaFechaHora;
  bool aceptaMantenimiento;
  String detalleServicio;
  String calidadServicio;

  OrdenData({
    required this.noOrden,
    required this.empresa,
    required this.zona,
    required this.agencia,
    required this.fecha,
    required this.horaInicio,
    required this.horaTermino,
    required this.noEquipo,
    required this.noEquipoSerie,
    required this.noInventario,
    required this.preventivoCompleto,
    required this.correctivo,
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
    required this.ups,
    required this.refaciones,
    required this.observaciones,
    // this.estadoUltimaVerificacionLiberada = false,
    required this.verificacionUltimaVersionLiberada,
    required this.actualizacionAntivirusCorporativo,
    required this.verificaFechaHora,
    required this.aceptaMantenimiento,
    required this.detalleServicio,
    required this.calidadServicio,
  });

  factory OrdenData.fromJson(Map<String, dynamic> json) => OrdenData(
        noOrden: json["noOrden"],
        empresa: json["empresa"],
        zona: json["zona"],
        agencia: json["agencia"],
        fecha: DateTime.parse(json["fecha"]),
        horaInicio: json["horaInicio"],
        horaTermino: json["horaTermino"],
        noEquipo: json["noEquipo"],
        noEquipoSerie: json["noEquipoSerie"],
        noInventario: json["noInventario"],
        preventivoCompleto: json["preventivoCompleto"],
        correctivo: json["correctivo"],
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
        ups: Ups.fromJson(json["ups"]),
        refaciones: List<Refacione>.from(
            json["refaciones"].map((x) => Refacione.fromJson(x))),
        observaciones: json["observaciones"],
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
        "noOrden": noOrden,
        "empresa": empresa,
        "zona": zona,
        "agencia": agencia,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "horaInicio": horaInicio,
        "horaTermino": horaTermino,
        "noEquipo": noEquipo,
        "noEquipoSerie": noEquipoSerie,
        "noInventario": noInventario,
        "preventivoCompleto": preventivoCompleto,
        "correctivo": correctivo,
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
        "ups": ups.toJson(),
        "refaciones": List<dynamic>.from(refaciones.map((x) => x.toJson())),
        "observaciones": observaciones,
        "verificacionUltimaVersionLiberada": verificacionUltimaVersionLiberada,
        "actualizacionAntivirusCorporativo": actualizacionAntivirusCorporativo,
        "verificaFechaHora": verificaFechaHora,
        "aceptaMantenimiento": aceptaMantenimiento,
        "detalleServicio": detalleServicio,
        "calidadServicio": calidadServicio,
      };
}

class Refacione {
  String nombre;
  String noSerie;
  String instalado;
  String retirado;

  Refacione({
    this.nombre = '',
    this.noSerie = '',
    this.instalado = '',
    this.retirado = '',
  });

  factory Refacione.fromJson(Map<String, dynamic> json) => Refacione(
        nombre: json["nombre"],
        noSerie: json["noSerie"],
        instalado: json["instalado"],
        retirado: json["retirado"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "noSerie": noSerie,
        "instalado": instalado,
        "retirado": retirado,
      };
}

class Ups {
  bool estado;
  Voltajes voltajesEntrada;
  Voltajes voltajesSalida;

  Ups({
    this.estado = false,
    Voltajes? voltajesEntrada,
    Voltajes? voltajesSalida,
  })  : voltajesEntrada = voltajesEntrada ?? Voltajes(nf: '', tf: '', nt: ''),
        voltajesSalida = voltajesSalida ?? Voltajes(nf: '', tf: '', nt: '');

  factory Ups.fromJson(Map<String, dynamic> json) => Ups(
        estado: json["estado"],
        voltajesEntrada: Voltajes.fromJson(json["voltajesEntrada"]),
        voltajesSalida: Voltajes.fromJson(json["voltajesSalida"]),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "voltajesEntrada": voltajesEntrada.toJson(),
        "voltajesSalida": voltajesSalida.toJson(),
      };
}

class Voltajes {
  String nt;
  String nf;
  String tf;

  Voltajes({
    required this.nt,
    required this.nf,
    required this.tf,
  });

  factory Voltajes.fromJson(Map<String, dynamic> json) => Voltajes(
        nt: json["nt"],
        nf: json["nf"],
        tf: json["tf"],
      );

  Map<String, dynamic> toJson() => {
        "nt": nt,
        "nf": nf,
        "tf": tf,
      };
}

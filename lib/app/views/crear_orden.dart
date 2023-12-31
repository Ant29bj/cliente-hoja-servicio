import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final/app/components/etiqueta.dart';
import 'package:proyecto_final/app/components/separador.dart';
import 'package:proyecto_final/app/models/orden.dart';
import 'package:proyecto_final/app/repository/orden_repository.dart';

class CrearOrden extends StatefulWidget {
  const CrearOrden({super.key});

  @override
  State<CrearOrden> createState() => _CrearOrdenState();
}

class _CrearOrdenState extends State<CrearOrden> {
  TimeOfDay _horaInicio = TimeOfDay.now();
  TimeOfDay _horaTermino = TimeOfDay.now();
  List<Refacione> refaccionesVacias = [];

  OrdenData ordenData = OrdenData(
    noOrden: ' ',
    empresa: ' ',
    zona: ' ',
    agencia: ' ',
    fecha: DateTime.now(),
    horaInicio: ' ',
    horaTermino: ' ',
    noEquipo: ' ',
    noEquipoSerie: ' ',
    noInventario: ' ',
    preventivoCompleto: false,
    correctivo: false,
    verificarComunicacionMonitoreo: false,
    verificarComunicacionSicom: false,
    preubasAceptacionBilletes: false,
    preubasAceptacionBilletesDesc: ' ',
    pruebasDispensadoMonedas: false,
    pruebasDispensadoMonedasDesc: ' ',
    preubasDispensadoBilletes: false,
    pruebasDispensadoBilletesDesc: ' ',
    pruebasImpresion: false,
    diagnosticoFallas: ' ',
    mantenimientoGabinete: false,
    organizacionEstadoCableado: false,
    mantenimientoPc: false,
    mantenimientoMonitor: false,
    mantenimientoEscaner: false,
    mantenimientoImpresora: false,
    mantenimientoTarjetaInterfaz: false,
    mantenimientoToneleros: false,
    mantenimientoDispensadorBilletes: false,
    mantenimientoAceptadorBilletes: false,
    mantenimientoAceptadorMonedas: false,
    pruebasAceptadorMonedas: false,
    ups: Ups(),
    refaciones: [],
    observaciones: ' ',
    verificacionUltimaVersionLiberada: ' ',
    actualizacionAntivirusCorporativo: false,
    verificaFechaHora: false,
    aceptaMantenimiento: false,
    estadoVerificacionUltimaVersionLiberada: false,
    detalleServicio: ' ',
    calidadServicio: 'BUENO',
  );

  String calidadServicio = 'BUENO';
  String detalleServicio = 'CORRECTIVO';

  void showTimePickerInicio() {
    showTimePicker(
      context: context,
      initialTime: _horaInicio,
    ).then((value) {
      setState(() {
        _horaInicio = value!;
        ordenData.horaInicio = value.format(context).toString();
      });
    });
  }

  void showTimePickerTermino() {
    showTimePicker(
      context: context,
      initialTime: _horaTermino,
    ).then((value) {
      setState(() {
        _horaTermino = value!;
        ordenData.horaTermino = value.format(context).toString();
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime fechaActual = DateTime.now();
    String _fechaActualFormateada =
        DateFormat('yyyy-MM-dd').format(fechaActual);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            const Separador(titulo: 'Informacion'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        ordenData.empresa = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Llene este campo';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Empresa',
                          hintText: 'CFE Suministros basicos'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            onSaved: (value) {
                              ordenData.zona = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Llene este campo';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Zona',
                              hintText: 'Los Mochis',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextFormField(
                            onSaved: (value) {
                              ordenData.agencia = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Llene este campo';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Agencia', hintText: 'Centro'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Etiqueta(
                      titulo: 'Fecha: ',
                      texto: _fechaActualFormateada,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Etiqueta(
                                  titulo: 'Hora Inicio: ',
                                  texto: _horaInicio.format(context).toString(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: showTimePickerInicio,
                                    iconSize: 15,
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Etiqueta(
                                  titulo: 'Hora termino: ',
                                  texto:
                                      _horaTermino.format(context).toString(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: showTimePickerTermino,
                                    iconSize: 15,
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Separador(titulo: 'DATOS DEL CFEMATICO'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                onSaved: (value) {
                                  ordenData.noEquipo = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Llene este campo';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'N/EQUIPO',
                                  hintText: 'LL4',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextFormField(
                                onSaved: (value) {
                                  ordenData.noEquipoSerie = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Llene este campo';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'N/SEIRE',
                                  hintText: 'DB07A1-LL4',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextFormField(
                                onSaved: (value) {
                                  ordenData.noInventario = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Llene este campo';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'N/Inventario',
                                  hintText: 'LL4',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'DETALLE DEL SERVICIO',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Row(
                              children: [
                                const Flexible(
                                  child: Text('PREVENTIVO COMPLETO:'),
                                ),
                                Checkbox(
                                  value: ordenData.preventivoCompleto,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.preventivoCompleto = value!;
                                    });
                                  },
                                ),
                                const Flexible(
                                  child: Text('CORRECTIVO:'),
                                ),
                                Checkbox(
                                  value: ordenData.correctivo,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.correctivo = value!;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Separador(titulo: 'MANTEMINIENTO'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO DE GABINIETE:'),
                                Checkbox(
                                  value: ordenData.mantenimientoGabinete,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoGabinete = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'ORGANIZACION Y ESTADO DEL CABLEADO:'),
                                Checkbox(
                                  value: ordenData.organizacionEstadoCableado,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.organizacionEstadoCableado =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO A PC:'),
                                Checkbox(
                                  value: ordenData.mantenimientoPc,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoPc = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO A MONITOR:'),
                                Checkbox(
                                  value: ordenData.mantenimientoMonitor,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoMonitor = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO A ESCANER:'),
                                Checkbox(
                                  value: ordenData.mantenimientoEscaner,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoEscaner = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO A IMPRESORA:'),
                                Checkbox(
                                  value: ordenData.mantenimientoImpresora,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoImpresora = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'MANTENIMEINTO A TARJETA IMPRESORA:'),
                                Checkbox(
                                  value: ordenData.mantenimientoTarjetaInterfaz,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoTarjetaInterfaz =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('MANTENIMEINTO A TONELEROS:'),
                                Checkbox(
                                  value: ordenData.mantenimientoToneleros,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoToneleros = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'MANTENIMEINTO A DISPENSADOR BILLETES:'),
                                Checkbox(
                                  value: ordenData
                                      .mantenimientoDispensadorBilletes,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData
                                              .mantenimientoDispensadorBilletes =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'MANTENIMEINTO A ACEPTADOR BILLETES:'),
                                Checkbox(
                                  value:
                                      ordenData.mantenimientoAceptadorBilletes,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoAceptadorBilletes =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    'MANTENIMEINTO A ACEPTADOR MONEDAS:'),
                                Checkbox(
                                  value:
                                      ordenData.mantenimientoAceptadorMonedas,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.mantenimientoAceptadorMonedas =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('REVISION UPS:'),
                                Checkbox(
                                  value: ordenData.ups.estado,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.ups.estado = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Voltaje de entrada:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesEntrada.nt =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'NT',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesEntrada.nf =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'NF',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesEntrada.tf =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'TF',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Voltaje de Salida:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesSalida.nt =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'NT',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesSalida.nf =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'NF',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        enabled: ordenData.ups.estado,
                                        onSaved: (value) {
                                          ordenData.ups.voltajesSalida.tf =
                                              value!;
                                        },
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty &&
                                                  ordenData.ups.estado) {
                                            return 'Llene este campo';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'TF',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            'REVISION VERIFICACION DE LA ULTIMA VERSION LIBERADA:',
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        Checkbox(
                                          value: ordenData
                                              .estadoVerificacionUltimaVersionLiberada,
                                          onChanged: (value) {
                                            setState(() {
                                              ordenData
                                                      .estadoVerificacionUltimaVersionLiberada =
                                                  value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      enabled: ordenData
                                          .estadoVerificacionUltimaVersionLiberada,
                                      decoration: const InputDecoration(
                                        labelText: 'Version Liberada',
                                        hintText: 'v2.14.5.1',
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'ACTUALIZACION DEL ANTIVIRUS CORPORATIVO:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData
                                      .actualizacionAntivirusCorporativo,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData
                                              .actualizacionAntivirusCorporativo =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'VERIFICAR FECHA Y HORA CORRECTA:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.verificaFechaHora,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.verificaFechaHora = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Separador(titulo: 'PRUEBAS'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'VERIFICAR COMUNICACION CON MONITOREO:',
                                ),
                                Checkbox(
                                  value:
                                      ordenData.verificarComunicacionMonitoreo,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.verificarComunicacionMonitoreo =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'VERIFICAR COMUNICACION CON SICOM:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.verificarComunicacionSicom,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.verificarComunicacionSicom =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'PRUEBAS DE ACEPTACION DE MONEDAS:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.pruebasAceptadorMonedas,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.pruebasAceptadorMonedas =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'PRUEBA DE ACEPTACION DE BILLETES:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.preubasAceptacionBilletes,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.preubasAceptacionBilletes =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'PRUEBAS DE DISPENSADO DE MONEDAS:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.pruebasDispensadoMonedas,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.pruebasDispensadoMonedas =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'PRUEBA DE DISPENSADO DE BILLETES:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.preubasDispensadoBilletes,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.preubasDispensadoBilletes =
                                          value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'LECTURA DE RECIBOS:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {
                                    value = value!;
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'LECTURA DE IMPRESION:',
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.pruebasImpresion,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.pruebasImpresion = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: TextFormField(
                                onSaved: (value) {
                                  ordenData.diagnosticoFallas = value!;
                                },
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  labelText: 'DIAGNOSTICO DE FALLAS',
                                  hintText: 'Escriba el diagnostico',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Reffacciones'),
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AgregarOrden(
                                              ordenData: this.ordenData,
                                              onRefaccionChanged:
                                                  (newRefacciones) {
                                                setState(() {
                                                  this.ordenData.refaciones =
                                                      newRefacciones;
                                                });
                                              },
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            ),
                            DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text('Nombre'),
                                ),
                                DataColumn(
                                  label: Text('No.Serie'),
                                ),
                                DataColumn(
                                  label: Text('Instalado'),
                                ),
                                DataColumn(
                                  label: Text('retirado'),
                                )
                              ],
                              rows: ordenData.refaciones.map((orden) {
                                return DataRow(cells: [
                                  DataCell(Text(orden.nombre)),
                                  DataCell(Text(orden.noSerie)),
                                  DataCell(Text(orden.instalado)),
                                  DataCell(Text(orden.retirado)),
                                ]);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          onSaved: (newValue) {
                            ordenData.observaciones = newValue!;
                          },
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            labelText: 'OBSERVACIONES',
                            hintText: 'Escriba las observaciones',
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Se acepta mantenimiento:',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Checkbox(
                                  value: ordenData.aceptaMantenimiento,
                                  onChanged: (value) {
                                    setState(() {
                                      ordenData.aceptaMantenimiento = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Calidad del servicio:'),
                                  DropdownButton<String>(
                                    value: calidadServicio,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        calidadServicio = newValue!;
                                      });
                                    },
                                    items: <String>['BUENO', 'REGULAR', 'MALO']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Detalle servicio:'),
                                  DropdownButton<String>(
                                    value: detalleServicio,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        detalleServicio = newValue!;
                                        ordenData.detalleServicio = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'PREVENTIVO_COMPLETO',
                                      'CORRECTIVO'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          _formKey.currentState?.save();

                          OrdenRepository ordenRepository = OrdenRepository();
                          ordenRepository.createHoja(ordenData);
                        }
                      },
                      child: const Text('Guardar'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgregarOrden extends StatefulWidget {
  final OrdenData ordenData;
  final Function(List<Refacione>) onRefaccionChanged;
  final Refacione? refaccionExistente; // Nuevo parámetro para manejar edición

  const AgregarOrden({
    required this.ordenData,
    required this.onRefaccionChanged,
    this.refaccionExistente,
  });
  @override
  State<AgregarOrden> createState() => _AgregarOrdenState();
}

class _AgregarOrdenState extends State<AgregarOrden> {
  var nombreController = TextEditingController();
  var noSerieController = TextEditingController();
  var instaladoController = TextEditingController();
  var retiradoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController();
    noSerieController = TextEditingController();
    instaladoController = TextEditingController();
    retiradoController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Separador(titulo: 'Agregar Refaccion'),
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: noSerieController,
              decoration: const InputDecoration(labelText: 'No de Serie'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: instaladoController,
              decoration: const InputDecoration(labelText: 'Instalado'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: retiradoController,
              decoration: const InputDecoration(labelText: 'Retirado'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final nombre = nombreController.text;
                final noSerie = noSerieController.text;
                final instalado = instaladoController.text;
                final retirado = retiradoController.text;
                Refacione refaccion = Refacione();

                refaccion.instalado = instalado;
                refaccion.nombre = nombre;
                refaccion.noSerie = noSerie;
                refaccion.retirado = retirado;

                if (widget.refaccionExistente != null) {
                  final index = widget.ordenData.refaciones
                      .indexOf(widget.refaccionExistente!);
                  setState(() {
                    widget.ordenData.refaciones[index] = refaccion;
                  });
                } else {
                  setState(() {
                    widget.ordenData.refaciones.add(refaccion);
                  });
                }

                nombreController.clear();
                noSerieController.clear();
                instaladoController.clear();
                retiradoController.clear();

                widget.onRefaccionChanged(widget.ordenData.refaciones);
              },
              child: const Text('Agregar'),
            )
          ],
        ),
      ),
    );
  }
}

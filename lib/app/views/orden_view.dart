import 'package:flutter/material.dart';
import 'package:proyecto_final/app/components/customCheckbox.dart';
import 'package:proyecto_final/app/components/etiqueta.dart';
import 'package:proyecto_final/app/models/orden.dart';

class OrdenView extends StatelessWidget {
  final OrdenData ordenData;
  const OrdenView({super.key, required this.ordenData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            _TituloHoja(ordenData: ordenData),
            const _Separador(
              titulo: "INFORMACION",
            ),
            _Informacion(ordenData: ordenData),
            const _Separador(
              titulo: 'DATOS DEL CFEMATICO',
            ),
            _DatosCfematico(ordenData: ordenData),
            _DetalleServicio(ordenData: ordenData),
            _Mantenimiento(ordenData: ordenData),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Center(
                      child: Text('Pruebas'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('VERIFICAR COMUNICACION CON MONITOREO:'),
                        CustomCheckBox(
                            checked: ordenData.verificarComunicacionMonitoreo)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('VERIFICAR COMUNICACION CON SICOM:'),
                        CustomCheckBox(
                            checked: ordenData.verificarComunicacionSicom)
                      ],
                    ),
                    // Falta pruebas dispensado de monedas

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('PRUEBA ACEPTACION DE BILLETES:'),
                        CustomCheckBox(
                            checked: ordenData.preubasAceptacionBilletes),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('PRUEBAS DE IMPRESION:'),
                        CustomCheckBox(checked: ordenData.pruebasImpresion),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Mantenimiento extends StatelessWidget {
  const _Mantenimiento({
    super.key,
    required this.ordenData,
  });

  final OrdenData ordenData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('MANTENIMEINTO'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMEINTO DE GABINIETE:'),
                CustomCheckBox(checked: ordenData.mantenimientoGabinete)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('ORGANIZCION Y ESTADO DE CABLEADO:'),
                CustomCheckBox(checked: ordenData.mantenimientoGabinete)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO A PC:'),
                CustomCheckBox(checked: ordenData.mantenimientoPc),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO A MONITOR:'),
                CustomCheckBox(checked: ordenData.mantenimientoMonitor)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO ESCANER:'),
                CustomCheckBox(checked: ordenData.mantenimientoEscaner)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO IMPRESORA:'),
                CustomCheckBox(checked: ordenData.mantenimientoImpresora)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIETO INTERFAZ:'),
                CustomCheckBox(checked: ordenData.mantenimientoTarjetaInterfaz)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO TONELEROS:'),
                CustomCheckBox(checked: ordenData.mantenimientoToneleros)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO DISPENSADOR DE BILLETES:'),
                CustomCheckBox(
                    checked: ordenData.mantenimientoDispensadorBilletes)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO ACEPTADOR DE BILLETES:'),
                CustomCheckBox(
                    checked: ordenData.mantenimientoAceptadorBilletes)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('MANTENIMIENTO ACEPTADOR DE MONEDAS:'),
                CustomCheckBox(checked: ordenData.mantenimientoAceptadorMonedas)
              ],
            ),
            // Falta dato verificacion de la ultima version liberada BOOL
            Etiqueta(
              titulo: 'VERSION LIBERADA: ',
              texto: ordenData.verificacionUltimaVersionLiberada,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('ACTUALIZACION DE ANTIVIRUS:'),
                CustomCheckBox(
                  checked: ordenData.actualizacionAntivirusCorporativo,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('VERIFICAR FECHA Y HORA CORRECTA:'),
                CustomCheckBox(checked: ordenData.verificaFechaHora),
              ],
            ),
            Row(
              children: [
                const Text('REVISION UPS:'),
                CustomCheckBox(checked: ordenData.ups.estado),
              ],
            ),
            ordenData.ups.estado
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Voltaje de entrada: '),
                          Etiqueta(
                            titulo: 'NT:',
                            texto: ordenData.ups.voltajesEntrada.nt,
                          ),
                          Etiqueta(
                            titulo: 'NF:',
                            texto: ordenData.ups.voltajesEntrada.nf,
                          ),
                          Etiqueta(
                            titulo: 'TF:',
                            texto: ordenData.ups.voltajesEntrada.tf,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Voltaje de salida: '),
                          Etiqueta(
                            titulo: 'NT:',
                            texto: ordenData.ups.voltajesSalida.nt,
                          ),
                          Etiqueta(
                            titulo: 'NF:',
                            texto: ordenData.ups.voltajesSalida.nf,
                          ),
                          Etiqueta(
                            titulo: 'TF:',
                            texto: ordenData.ups.voltajesSalida.tf,
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _DetalleServicio extends StatelessWidget {
  const _DetalleServicio({
    super.key,
    required this.ordenData,
  });

  final OrdenData ordenData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'DETALLE SERVICIO',
              ),
            ),
            Row(
              children: [
                const Text('PREVENTIVO COMPLETO:'),
                CustomCheckBox(checked: ordenData.preventivoCompleto),
                const Text('CORRECTIVO:'),
                CustomCheckBox(checked: ordenData.correctivo),
              ],
            ),
            Etiqueta(titulo: 'No. De Ticket: ', texto: ordenData.noOrden),
            const SizedBox(
              height: 12,
            ),
            Etiqueta(
                titulo: 'Fecha y hora de otorgamiento: ',
                texto: '${ordenData.fecha} ${ordenData.horaInicio}'),
          ],
        ),
      ),
    );
  }
}

class _DatosCfematico extends StatelessWidget {
  const _DatosCfematico({
    required this.ordenData,
  });

  final OrdenData ordenData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Etiqueta(titulo: "N/EQUIPO: ", texto: ordenData.noEquipo),
            Etiqueta(titulo: "N/SERIE: ", texto: ordenData.noEquipoSerie),
            Etiqueta(titulo: "N/INVENTARIO: ", texto: ordenData.noInventario),
          ],
        ),
      ),
    );
  }
}

class _Separador extends StatelessWidget {
  final String titulo;
  const _Separador({
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(titulo),
        ),
      ),
    );
  }
}

class _TituloHoja extends StatelessWidget {
  const _TituloHoja({
    required this.ordenData,
  });

  final OrdenData ordenData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Hoja de servicio'),
            Text('No. Orden ${ordenData.noOrden}')
          ],
        ),
      ),
    );
  }
}

class _Informacion extends StatelessWidget {
  final OrdenData ordenData;
  const _Informacion({super.key, required this.ordenData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Etiqueta(titulo: "EMPRESA: ", texto: ordenData.empresa),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Etiqueta(titulo: 'ZONA:', texto: ordenData.zona),
                  const SizedBox(
                    width: 32,
                  ),
                  Etiqueta(titulo: 'AGENCIA: ', texto: ordenData.agencia),
                ],
              ),
              Etiqueta(
                titulo: 'FECHA: ',
                texto: ordenData.fecha.toString(),
              ),
              Row(
                children: [
                  Etiqueta(
                    titulo: 'HORA INICIO: ',
                    texto: ordenData.horaInicio,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Etiqueta(
                    titulo: 'HORA TERMINO: ',
                    texto: ordenData.horaTermino,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

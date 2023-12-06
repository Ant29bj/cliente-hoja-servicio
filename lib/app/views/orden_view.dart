import 'package:flutter/material.dart';
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
        body: Column(
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
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('DETALLE SERVICIO'),
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

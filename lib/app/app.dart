import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/app/components/etiqueta.dart';
import 'package:proyecto_final/app/models/orden.dart';
import 'package:proyecto_final/app/services/hoja_servicio_provider.dart';
import 'package:proyecto_final/app/views/orden_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HojaProvider>(
      create: (_) => HojaProvider()..fetchOrdenLista(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _OrdenList(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('En construccion');
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _OrdenList extends StatelessWidget {
  const _OrdenList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HojaProvider>(
        builder: (_, provider, __) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.ordenList.isEmpty) {
            return const Center(
              child: Text('No hay ordenes'),
            );
          }

          return (ListView.separated(
            itemCount: provider.ordenList.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (_, index) => _OrdenListaItem(
              ordenData: provider.ordenList[index],
            ),
          ));
        },
      ),
    );
  }
}

class _OrdenListaItem extends StatelessWidget {
  final OrdenData ordenData;
  const _OrdenListaItem({required this.ordenData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OrdenView(ordenData: ordenData);
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Etiqueta(
                titulo: 'No. Orden:',
                texto: ordenData.noOrden,
              ),
              GestureDetector(
                child: const Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return OrdenView(ordenData: ordenData);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Separador extends StatelessWidget {
  final String titulo;
  const Separador({
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

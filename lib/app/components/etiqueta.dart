import 'package:flutter/material.dart';

class Etiqueta extends StatelessWidget {
  final String titulo;
  final String texto;
  const Etiqueta({
    super.key,
    required this.titulo,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: titulo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: texto,
          ),
        ],
      ),
    );
  }
}

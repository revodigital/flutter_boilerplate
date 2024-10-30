import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Errore nella richiesta', style: TextStyle(color: Colors.red), textAlign: TextAlign.center,),
    );
  }
}
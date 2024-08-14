import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Społeczność i interakcje."));
  }
}

double parseDouble(dynamic value) {
  try {
    return double.parse(value.toString());
  } catch (e) {
    return 0.0; // Zwróć domyślną wartość w przypadku błędu
  }
}
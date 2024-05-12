import 'package:flutter/material.dart';
import 'login_with.dart';
import 'login_email.dart'; 
import 'registration_screen.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twoja Aplikacja',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login_email': (context) => const LoginEmailScreen(),
        '/registration': (context) => const RegistrationScreen(), 
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
      },
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: const Center(
        child: Text('Strona nie znaleziona'),
      ),
    );
  }
}


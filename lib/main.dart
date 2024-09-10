import 'package:flutter/material.dart';
import 'login_with.dart';
import 'login_email.dart'; 
import 'login_gui.dart';
import 'registration_screen.dart'; 
import 'pages/notfound_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrace',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login_email': (context) => const LoginEmailScreen(),
        '/registration': (context) => const RegistrationScreen(), 
        '/login_gui.dart': (context) => const LoginGUIScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
      },
    );
  }
}



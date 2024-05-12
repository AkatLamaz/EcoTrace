import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int _currentStep = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C8743),
        title: const Text("Ekran rejestracji"),
      ),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Pozwól na dostosowanie UI do klawiatury
        backgroundColor: Colors.transparent, // Ustaw tło Scaffold na przezroczyste
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenHeight * 0.05),
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  if (_currentStep == 0) _emailStep(),
                  if (_currentStep == 1) _passwordStep(),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
  }

  Widget _emailStep() {
    return Column(
      children: [
        const Text(
          'Podaj adres e-mail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF4C8743),
            minimumSize: const Size(270, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            setState(() {
              _currentStep = 1;
            });
          },
          child: const Text(
            'Dalej',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _passwordStep() {
    return Column(
      children: [
        const Text(
          'Podaj hasło',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Hasło',
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Powtórz hasło',
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF4C8743),
            minimumSize: const Size(270, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Logika sprawdzania zgodności haseł i rejestracji
          },
          child: const Text(
            'Zarejestruj się',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

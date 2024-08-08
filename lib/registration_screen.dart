import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();

  String? _generatedCode;
  Timer? _timer;
  int _start = 60;
  bool _isCodeSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _verificationCodeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _start = 60;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isCodeSent = false;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void sendVerificationCode() {
    if (_isCodeSent) return;

    setState(() {
      _isCodeSent = true;
      _generatedCode = generateRandomCode();
      startTimer();
    });

    // logika wysylania kodu na e-mail
    print("Wysłany kod weryfikacyjny: $_generatedCode");
  }

  String generateRandomCode() {
    var rng = Random();
    return (100000 + rng.nextInt(900000)).toString();
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
                  horizontal: screenWidth * 0.3,
                  vertical: screenHeight * 0.2),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    _emailField(),
                    const SizedBox(height: 20),
                    _passwordField(),
                    const SizedBox(height: 20),
                    _confirmPasswordField(),
                    const SizedBox(height: 20),
                    _verificationCodeField(),
                    const SizedBox(height: 20),
                    _sendCodeButton(),
                    const SizedBox(height: 20),
                    _registerButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
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
    );
  }

  Widget _passwordField() {
    return TextField(
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
    );
  }

  Widget _confirmPasswordField() {
    return TextField(
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
    );
  }

  Widget _verificationCodeField() {
    return TextField(
      controller: _verificationCodeController,
      decoration: InputDecoration(
        labelText: 'Kod weryfikacyjny',
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
      ]
    );
  }

  Widget _sendCodeButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4C8743),
        minimumSize: const Size(270, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: _isCodeSent
          ? null
          : () {
              sendVerificationCode();
            },
      child: _isCodeSent
          ? Text(
              'Wyślij ponownie za $_start s',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          : const Text(
              'Wyślij kod',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
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
        if (_passwordController.text == _confirmPasswordController.text &&
            _verificationCodeController.text == _generatedCode) {
          // Logika rejestracji
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Rejestracja zakończona sukcesem!'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Niepoprawne dane. Sprawdź kod weryfikacyjny i hasła.'),
            ),
          );
        }
      },
      child: const Text(
        'Zarejestruj się',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C8743),
        title: const Text("Ekran logowania"),
      ),
      body: Container(
        width: screenWidth, // Ustaw szerokość na szerokość ekranu
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.25, // 10% szerokości ekranu
            vertical: screenHeight * 0.1 // 10% wysokości ekranu
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/logo.png"),
                //const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nazwa użytkownika',
                    fillColor: Colors.grey[200], // Lekko szare tło
                    filled: true, // Włączenie tła
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Zaokrąglone rogi
                      borderSide: BorderSide.none, // Brak obramowania
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding wewnątrz pola
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Hasło',
                    fillColor: Colors.grey[200], // Lekko szare tło
                    filled: true, // Włączenie tła
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Zaokrąglone rogi
                      borderSide: BorderSide.none, // Brak obramowania
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding wewnątrz pola
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
                    Navigator.pushNamed(context, '/login_gui.dart');
                  },
                  child: const Text(
                    'Zaloguj się',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
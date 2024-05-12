import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C8743),
        title: const Center(
          child: Text("Just code "),
        ),
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
            horizontal: screenWidth * 0.1, // 10% szerokości ekranu
            vertical: screenHeight * 0.03 // 10% wysokości ekranu
            ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                  10), // Ustawienie odstępu od góry na 20 pikseli
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fill,
                height: 200,
                width: 200,
              ),
            ),
            //const SizedBox(height: 20),
            const Text(
              'Zaloguj za pomocą',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const EmailButton(),
            const SizedBox(height: 5),
            const GoogleButton(),
            const SizedBox(height: 5),
            const FacebookButton(),
            const SizedBox(height: 35),
            const Text(
              'Nie masz konta?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
            ),
            const SizedBox(height: 10),
            const ZarejestrujButton(),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const LoginButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

//buttons

class ZarejestrujButton extends StatelessWidget {
  const ZarejestrujButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4C8743), // Ujednolicenie koloru z innymi przyciskami
        minimumSize: const Size(220, 50), // Ujednolicenie rozmiaru z innymi przyciskami
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Zaokrąglone rogi
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/registration');
      },
      child: const Text(
        'Zarejestruj się',
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class EmailButton extends StatelessWidget {
  const EmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.email, color: Colors.white),
      label: const Text(
        'Email',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey, // Szary kolor dla przycisku Email
        minimumSize: const Size(270, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/login_email');
      },
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.g_mobiledata, color: Colors.white),
      label: const Text('Google',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFDB4437),
        minimumSize: const Size(270, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        // Implement Google login logic
      },
    );
  }
}

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.facebook, color: Colors.white),
      label: const Text(
        'Facebook',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF3B5998), // Kolor tekstu
        minimumSize: const Size(270, 40), // Minimalny rozmiar przycisku
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Zaokrąglone rogi
        ),
      ),
      onPressed: () {
        // Implement Facebook login logic
      },
    );
  }
}

import 'dependencies/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'pages/home_page.dart';
import 'pages/emmision_page.dart';
import 'pages/action_page.dart';
import 'pages/user_page.dart';

class LoginGUIScreen extends StatefulWidget {
  const LoginGUIScreen({super.key});

  @override
  _LoginGUIScreenState createState() => _LoginGUIScreenState();
}

class _LoginGUIScreenState extends State<LoginGUIScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ActionsPage(),
    const EmissionsPage(),
    const UserPage(),
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF4C8743),
        bottom: kIsWeb
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: FlashyTabBar(
                  selectedIndex: _selectedIndex,
                  showElevation: true,
                  onItemSelected: (index) => setState(() {
                    _selectedIndex = index;
                  }),
                  items: [
                    FlashyTabBarItem(
                      icon: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    FlashyTabBarItem(
                      icon: const Icon(Icons.eco),
                      title: const Text('Akcje'),
                    ),
                    FlashyTabBarItem(
                      icon: const Icon(Icons.cloud),
                      title: const Text('Emisja'),
                    ),
                    FlashyTabBarItem(
                      icon: const Icon(Icons.group),
                      title: const Text('Społeczność'),
                    ),
                  ],
                ),
              )
            : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Stack (
             children: _widgetOptions.asMap().entries.map((entry) {
              return Offstage(
                offstage: _selectedIndex != entry.key,
                child: entry.value,
            );
          }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: kIsWeb
          ? null
          : FlashyTabBar(
              selectedIndex: _selectedIndex,
              showElevation: false,
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.eco),
                  title: const Text('Akcje'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.cloud),
                  title: const Text('Emisja'),
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.group),
                  title: const Text('Społeczność'),
                ),
              ],
            ),
    );
  }
}

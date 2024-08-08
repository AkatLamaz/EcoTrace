import 'dependencies/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'graph/graph_conf.dart';
import 'package:flutter/foundation.dart';

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
    const CommunityPage(),
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
              )
            : null,
      ),
      body: Stack(
        children: _widgetOptions.asMap().entries.map((entry) {
          return Offstage(
            offstage: _selectedIndex != entry.key,
            child: entry.value,
          );
        }).toList(),
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

//Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          GreetingSection(),
          ActionStepsSection(),
          RegisterSection(),
          FeedbackSection(),
          StatisticsSection(),
          AchievementsSection(),
          OtherLinksSection(),
          WhyThisMattersSection(),
        ],
      ),
    );
  }
}

  class GreetingSection extends StatelessWidget {
    const GreetingSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Hello, Hero',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  class ActionStepsSection extends StatelessWidget {
    const ActionStepsSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text('Try these steps next!'),
          subtitle: Text('1. Mark Actions you already do\n2. Refine emissions inputs\n3. Add an Action to your goals'),
        ),
      );
    }
  }

  class RegisterSection extends StatelessWidget {
    const RegisterSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.person_add),
          title: Text('Register'),
          subtitle: Text('Sign up and personalize it to see your full Earth Hero features.'),
        ),
      );
    }
  }

  class FeedbackSection extends StatelessWidget {
    const FeedbackSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.feedback),
          title: Text('Would you help us improve Earth Hero?'),
          subtitle: Text('We would like feedback on the Actions interface. If interested, please complete this 10-minute survey.'),
        ),
      );
    }
  }

  class StatisticsSection extends StatelessWidget {
    const StatisticsSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.bar_chart),
          title: Text('Total Earth Heroes: 128,830'),
          subtitle: Text('Actions achieved: 745,159\nEmissions saved: 142,914t'),
        ),
      );
    }
  }

  class AchievementsSection extends StatelessWidget {
    const AchievementsSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.star),
          title: Text('My Achievements'),
          subtitle: Text('Set a Target to reduce emission and we will help you get there.'),
        ),
      );
    }
  }

  class OtherLinksSection extends StatelessWidget {
    const OtherLinksSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(Icons.link),
          title: Text('Other Links'),
          subtitle: Text('Newsletter, Contact Us, Sources and Recognition'),
        ),
      );
    }
  }

  class WhyThisMattersSection extends StatelessWidget {
    const WhyThisMattersSection({super.key});

    @override
    Widget build(BuildContext context) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Why This Matters: The Story of Climate Change. A Comic of Worldly Proportions. We can make a difference together.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
  }

//Actions Page
class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Informacje o akcjach."));
  }
}

//Emissions Page
class EmissionsPage extends StatelessWidget {
  const EmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 400, // Określenie wymiarów
            child: MyRelativeEmissionsChart(),
          ),
          const SizedBox(
            width: 200,
            height: 200, // Określenie wymiarów
            child: EmissionsOverTimeChart(),
          ),
        ],
      ),
    );
  }
}

//Community Page
class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

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

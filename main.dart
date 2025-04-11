import 'package:flutter/material.dart';
import 'utils/user_preferences.dart';
import 'screens/welcome_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _decideStartScreen() async {
    bool isFirstTime = await UserPreferences.isFirstTime();
    return isFirstTime ? const WelcomeScreen() : const SettingsScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (context) => const SettingsScreen(),
      },
      home: FutureBuilder<Widget>(
        future: _decideStartScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!;
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}

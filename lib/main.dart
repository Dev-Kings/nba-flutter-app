import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nba/screens/scoreboard_screen.dart';
import 'package:nba/screens/teams_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 96, 180, 201),
          title: Text('NBA App'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: 'Scoreboard',
              ),
              Tab(
                icon: Icon(Icons.people),
                text: 'Teams',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AnimatedSwitcher(
              duration: Duration(microseconds: 500),
              child: ScoreboardScreen(),
            ),
            AnimatedSwitcher(
              duration: Duration(microseconds: 500),
              child: TeamsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

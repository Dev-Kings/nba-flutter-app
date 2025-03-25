import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nba/providers/nba_providers.dart';

class ScoreboardScreen extends ConsumerWidget {
  const ScoreboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreboardAsync = ref.watch(scoreboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('NBA Scoreboard'),
      ),
      body: scoreboardAsync.when(
        data: (games) => ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        '${game.gameTime} | ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.network(
                        game.homeLogo,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.error,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        game.home,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('vs'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        game.away,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 10),
                      Image.network(
                        game.awayLogo,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.error,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

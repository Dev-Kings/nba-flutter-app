import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nba/providers/nba_providers.dart';

class TeamsScreen extends ConsumerWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamsAsync = ref.watch(teamsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('NBA Teams')),
      body: teamsAsync.when(
        data: (teams) => ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 3,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        team.logo,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, size: 40);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  title: Text('Name: ${team.teamName} (${team.teamAbv})'),
                  subtitle: Text('City: ${team.teamCity}'),
                  style: ListTileStyle.drawer,
                ),
              );
            }),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}

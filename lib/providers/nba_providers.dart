import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nba/models/games.dart';
import 'package:nba/models/teams.dart';
import 'package:nba/services/nba_api_service.dart';

// Instantiate API Service
final nbaApiServiceProvider = Provider<NbaApiService>((ref) {
  return NbaApiService();
});

// Provider for fetching NBA Teams
final teamsProvider = FutureProvider<List<NBATeam>>((ref) async {
  final apiService = ref.watch(nbaApiServiceProvider);
  return apiService.getTeams();
});

// Provider for fetching NBA Scoreboard
final scoreboardProvider = FutureProvider<List<NBAGame>>((ref) async {
  final apiService = ref.watch(nbaApiServiceProvider);
  final games = await apiService.getDailyScoreboard();
  final teams = await ref.watch(nbaTeamsAbv.future);

  return games.map((game) {
    return NBAGame(
      home: teams[game.home]?.teamName ?? 'Unknown',
      away: teams[game.away]?.teamName ?? 'Unknown',
      gameStatus: game.gameStatus,
      gameTime: game.gameTime,
      homeLogo: teams[game.home]?.logo ?? 'Unknown',
      awayLogo: teams[game.away]?.logo ?? 'Unknown',
    );
  }).toList();
});

// Provider for teamAbbreviation
final nbaTeamsAbv = FutureProvider<Map<String, NBATeam>>((ref) async {
  final teams = await ref.watch(nbaApiServiceProvider).getTeams();

  // Convert list to a map for quick lookup by abbreviation (treamAbv)
  return {for (var team in teams) team.teamAbv: team};
});

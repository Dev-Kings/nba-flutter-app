import 'package:nba/models/teams.dart';

class NBAGame {
  final String home;
  final String away;
  final String gameStatus;
  final String gameTime;
  final String homeLogo;
  final String awayLogo;

  NBAGame(
      {required this.home,
      required this.away,
      required this.gameStatus,
      required this.gameTime,
      required this.homeLogo,
      required this.awayLogo});

  factory NBAGame.fromJson(Map<String, dynamic> json, Map<String, NBATeam> teams) {
    return NBAGame(
      home: json['home'] ?? 'Home Team',
      away: json['away'] ?? 'Away Team',
      gameStatus: json['gameStatus'] ?? 'Unknown',
      gameTime: json['gameTime'] ?? 'Unknown',
      homeLogo: teams[json['home']]?.logo ?? 'Unknown',
      awayLogo: teams[json['away']]?.logo ?? 'Unknown',
    );
  }
}

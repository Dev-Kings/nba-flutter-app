import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nba/models/games.dart';
import 'package:nba/models/teams.dart';

class NbaApiService {
  static const String _baseUrl = 'https://tank01-fantasy-stats.p.rapidapi.com';
  static final _headers = <String, String>{
    'x-rapidapi-key': dotenv.env['RAPIDAPI_KEY'] ?? '',
    'x-rapidapi-host': 'tank01-fantasy-stats.p.rapidapi.com',
  };

  // Get NBA Daily Scoreboard
  Future<List<NBAGame>> getDailyScoreboard() async {
    final teams = await getTeams();
    final Map<String, NBATeam> teamsMap = {
      for (var team in teams) team.teamAbv: team
    };

    final response = await http.get(
      Uri.parse('$_baseUrl/getNBAScoresOnly'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> gamesData = jsonData['body'];

      List<NBAGame> games = gamesData.entries.map((entry) {
        return NBAGame.fromJson(entry.value, teamsMap);
      }).toList();

      return games;
    } else {
      throw Exception('Failed to load daily scoreboard');
    }
  }

  // Get NBA Teams
  Future<List<NBATeam>> getTeams() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/getNBATeams'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> teamsList = jsonData['body'];

      List<NBATeam> teams = teamsList
          .map((team) => NBATeam.fromJson(team as Map<String, dynamic>))
          .toList();

      teams.sort((a, b) => a.teamName.compareTo(b.teamName));

      return teams;
    } else {
      throw Exception('Failed to load NBA teams');
    }
  }
}

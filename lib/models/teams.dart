class NBATeam {
  final String teamName;
  final String teamAbv;
  final String teamCity;
  final String logo;

  NBATeam(
      {required this.teamName,
      required this.teamAbv,
      required this.teamCity,
      required this.logo});

  factory NBATeam.fromJson(Map<String, dynamic> json) {
    return NBATeam(
      teamName: json['teamName'] ?? 'No Name',
      teamAbv: json['teamAbv'] ?? 'No Abbreviation',
      teamCity: json['teamCity'] ?? 'No City',
      logo: json['espnLogo1'] ?? '',
    );
  }
}

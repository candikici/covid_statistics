import 'dart:convert';

class CountriesData {
  String country = "";
  String totalCases = "";
  String newCases = "";
  String totalDeaths = "";
  String newDeaths = "";
  String totalDiscovered = "";
  String activeCases = "";
  CountriesData({
    required this.country,
    required this.totalCases,
    required this.newCases,
    required this.totalDeaths,
    required this.newDeaths,
    required this.totalDiscovered,
    required this.activeCases,
  });

  CountriesData copyWith({
    String? country,
    String? totalCases,
    String? newCases,
    String? totalDeaths,
    String? newDeaths,
    String? totalDiscovered,
    String? activeCases,
  }) {
    return CountriesData(
      country: country ?? this.country,
      totalCases: totalCases ?? this.totalCases,
      newCases: newCases ?? this.newCases,
      totalDeaths: totalDeaths ?? this.totalDeaths,
      newDeaths: newDeaths ?? this.newDeaths,
      totalDiscovered: totalDiscovered ?? this.totalDiscovered,
      activeCases: activeCases ?? this.activeCases,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'totalCases': totalCases,
      'newCases': newCases,
      'totalDeaths': totalDeaths,
      'newDeaths': newDeaths,
      'totalDiscovered': totalDiscovered,
      'activeCases': activeCases,
    };
  }

  factory CountriesData.fromMap(Map<String, dynamic> map) {
    return CountriesData(
      country: map['country'] ?? "Unknown",
      totalCases: map['totalCases'] ?? "Unknown",
      newCases: map['newCases'] ?? "Unknown",
      totalDeaths: map['totalDeaths'] ?? "Unknown",
      newDeaths: map['newDeaths'] ?? "Unknown",
      totalDiscovered: map['totalDiscovered'] ?? "Unknown",
      activeCases: map['activeCases'] ?? "Unknown",
    );
  }

  String toJson() => json.encode(toMap());

  factory CountriesData.fromJson(String source) =>
      CountriesData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountriesData(country: $country, totalCases: $totalCases, newCases: $newCases, totalDeaths: $totalDeaths, newDeaths: $newDeaths, totalDiscovered: $totalDiscovered, activeCases: $activeCases)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountriesData &&
        other.country == country &&
        other.totalCases == totalCases &&
        other.newCases == newCases &&
        other.totalDeaths == totalDeaths &&
        other.newDeaths == newDeaths &&
        other.totalDiscovered == totalDiscovered &&
        other.activeCases == activeCases;
  }

  @override
  int get hashCode {
    return country.hashCode ^
        totalCases.hashCode ^
        newCases.hashCode ^
        totalDeaths.hashCode ^
        newDeaths.hashCode ^
        totalDiscovered.hashCode ^
        activeCases.hashCode;
  }
}

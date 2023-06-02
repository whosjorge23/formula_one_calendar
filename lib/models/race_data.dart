class RaceData {
  final MRData mRData;

  RaceData({required this.mRData});

  factory RaceData.fromJson(Map<String, dynamic> json) {
    return RaceData(
      mRData: MRData.fromJson(json['MRData']),
    );
  }
}

class MRData {
  final RaceTable raceTable;

  MRData({required this.raceTable});

  factory MRData.fromJson(Map<String, dynamic> json) {
    return MRData(
      raceTable: RaceTable.fromJson(json['RaceTable']),
    );
  }
}

class RaceTable {
  final List<Race> races;

  RaceTable({required this.races});

  factory RaceTable.fromJson(Map<String, dynamic> json) {
    var list = json['Races'] as List;
    List<Race> racesList = list.map((i) => Race.fromJson(i)).toList();
    return RaceTable(races: racesList);
  }
}

class Race {
  final String season;
  final String round;
  final String url;
  final String raceName;
  final Circuit circuit;
  final String date;
  final String time;
  final Practice? firstPractice;
  final Practice? secondPractice;
  final Practice? thirdPractice;
  final Practice? qualifying;

  Race({
    required this.season,
    required this.round,
    required this.url,
    required this.raceName,
    required this.circuit,
    required this.date,
    required this.time,
    this.firstPractice,
    this.secondPractice,
    this.thirdPractice,
    this.qualifying,
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(
      season: json['season'],
      round: json['round'],
      url: json['url'],
      raceName: json['raceName'],
      circuit: Circuit.fromJson(json['Circuit']),
      date: json['date'],
      time: json['time'],
      firstPractice: json['FirstPractice'] != null ? Practice.fromJson(json['FirstPractice']) : null,
      secondPractice: json['SecondPractice'] != null ? Practice.fromJson(json['SecondPractice']) : null,
      thirdPractice: json['ThirdPractice'] != null ? Practice.fromJson(json['ThirdPractice']) : null,
      qualifying: json['Qualifying'] != null ? Practice.fromJson(json['Qualifying']) : null,
    );
  }
}

class Circuit {
  final String circuitId;
  final String url;
  final String circuitName;
  final Location location;

  Circuit({
    required this.circuitId,
    required this.url,
    required this.circuitName,
    required this.location,
  });

  factory Circuit.fromJson(Map<String, dynamic> json) {
    return Circuit(
      circuitId: json['circuitId'],
      url: json['url'],
      circuitName: json['circuitName'],
      location: Location.fromJson(json['Location']),
    );
  }
}

class Location {
  final String lat;
  final String long;
  final String locality;
  final String country;

  Location({
    required this.lat,
    required this.long,
    required this.locality,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      long: json['long'],
      locality: json['locality'],
      country: json['country'],
    );
  }
}

class Practice {
  final String date;
  final String time;

  Practice({
    required this.date,
    required this.time,
  });

  factory Practice.fromJson(Map<String, dynamic> json) {
    return Practice(
      date: json['date'],
      time: json['time'],
    );
  }
}

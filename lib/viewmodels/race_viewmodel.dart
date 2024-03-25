import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:formula_one_calendar/models/race.dart';

import '../models/race.dart';

class RaceListViewModel {
  List<Race> races = [];
  List<Circuit> circuitLocation = [];
  Race? selectedRace;

  // LatLng? location;

  Future<List<Race>?> fetchRaces() async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/2023.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = RaceData.fromJson(jsonData);
      races = result.mrData?.raceTable?.races ?? [];
      return races;
    } else {
      Future.delayed(const Duration(seconds: 10), fetchRaces);
    }
  }

  Future<List<Circuit>?> fetchCircuitLocation() async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/2023.json'));
    if (response.statusCode == 200) {
      RaceData raceData = RaceData.fromJson(jsonDecode(response.body));
      for (var race in raceData.mrData!.raceTable!.races) {
        Circuit newCircuit = Circuit(
          circuitId: race.circuit?.circuitId,
          url: race.circuit?.url,
          circuitName: race.circuit?.circuitName,
          location: Location(
            lat: race.circuit?.location?.lat,
            long: race.circuit?.location?.long,
            locality: race.circuit?.location?.locality,
            country: race.circuit?.location?.country,
          ),
        );
        circuitLocation.add(newCircuit);
      }
      return circuitLocation;
    } else {
      throw Exception('Failed to load race data');
    }
  }

// Define a helper function to format the date
  String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('MM/dd/yyyy');
      return formatter.format(date);
    } catch (e) {
      return '🤷‍♂️🤷‍♂️';
    }
  }
}

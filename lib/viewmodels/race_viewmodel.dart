import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:formula_one_calendar/models/race_data.dart';

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
      races = result.mRData.raceTable.races;
      return races;
    } else {
      Future.delayed(const Duration(seconds: 10), fetchRaces);
    }
  }

  // Define a helper function to format the time in GMT timezone
  String formatTimeInGMT(String timeString) {
    final format = DateFormat("HH:mm:ss'Z'", 'en_US');
    // format.timeZone = 'GMT';

    try {
      final date = format.parse(timeString);
      final formatter = DateFormat('HH:mm');
      return formatter.format(date.toLocal());
    } catch (e) {
      return '🤷‍♂️🤷‍♂️';
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

  String countryFlag(String country) {
    switch (country) {
      case 'Bahrain':
        return '🇧🇭';
      case 'UK':
        return '🇬🇧';
      case 'Saudi Arabia':
        return '🇸🇦';
      case 'Australia':
        return '🇦🇺';
      case 'Azerbaijan':
        return '🇦🇿';
      case 'USA':
        return '🇺🇸';
      case 'United States':
        return '🇺🇸';
      case 'Italy':
        return '🇮🇹';
      case 'Monaco':
        return '🇲🇨';
      case 'Spain':
        return '🇪🇸';
      case 'Canada':
        return '🇨🇦';
      case 'Austria':
        return '🇦🇹';
      case 'Hungary':
        return '🇭🇺';
      case 'Belgium':
        return '🇧🇪';
      case 'Netherlands':
        return '🇳🇱';
      case 'Singapore':
        return '🇸🇬';
      case 'Japan':
        return '🇯🇵';
      case 'Qatar':
        return '🇶🇦';
      case 'Mexico':
        return '🇲🇽';
      case 'Brazil':
        return '🇧🇷';
      case 'UAE':
        return '🇦🇪';
      default:
        return 'Country';
    }
  }


}
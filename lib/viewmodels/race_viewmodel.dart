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

  String circuitPic(String circuitName) {
    switch (circuitName) {
    case "Bahrain International Circuit":
    return "https://media.formula1.com/image/upload/f_auto/q_auto/v1677245035/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Bahrain.png.transform/2col-retina/image.png";
    case "Jeddah Corniche Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Saudi%20Arabia.png.transform/2col-retina/image.png";
    case "Albert Park Grand Prix Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Australia.png.transform/2col-retina/image.png";
    case "Baku City Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Azerbaijan.png.transform/2col-retina/image.png";
    case "Miami International Autodrome":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Miami.png.transform/2col-retina/image.png";
    case "Autodromo Enzo e Dino Ferrari":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia%20Romagna.png.transform/2col-retina/image.png";
    case "Circuit de Monaco":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Monaco.png.transform/2col-retina/image.png";
    case "Circuit de Barcelona-Catalunya":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Spain.png.transform/2col-retina/image.png";
    case "Circuit Gilles Villeneuve":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Canada.png.transform/2col-retina/image.png";
    case "Red Bull Ring":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Austria.png.transform/2col-retina/image.png";
    case "Silverstone Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Great%20Britain.png.transform/2col-retina/image.png";
    case "Hungaroring":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Hungary.png.transform/2col-retina/image.png";
    case "Circuit de Spa-Francorchamps":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Belgium.png.transform/2col-retina/image.png";
    case "Circuit Park Zandvoort":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Netherlands.png.transform/2col-retina/image.png";
    case "Autodromo Nazionale di Monza":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Italy.png.transform/2col-retina/image.png";
    case "Marina Bay Street Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Singapore.png.transform/2col-retina/image.png";
    case "Suzuka Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Japan.png.transform/2col-retina/image.png";
    case "Losail International Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Qatar.png.transform/2col-retina/image.png";
    case "Circuit of the Americas":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/United%20States.png.transform/2col-retina/image.png";
    case "Autódromo Hermanos Rodríguez":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Mexico.png.transform/2col-retina/image.png";
    case "Autódromo José Carlos Pace":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Brazil.png.transform/2col-retina/image.png";
    case "Las Vegas Strip Street Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Las%20Vegas.png.transform/2col-retina/image.png";
    case "Yas Marina Circuit":
    return "https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Abu%20Dhabi.png.transform/2col-retina/image.png";
    default:
    return "Country";
    }
  }


}
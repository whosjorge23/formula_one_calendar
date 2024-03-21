import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/constructor.dart';

class ConstructorsViewModel {
  List<Constructors> constructors = [];

  Future<List<Constructors>?> fetchConstructors() async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/2023/constructors.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = ConstructorData.fromJson(jsonData);
      constructors = result.mrData?.constructorTable?.constructors ?? [];
      return constructors;
    } else {
      Future.delayed(const Duration(seconds: 10), fetchConstructors);
    }
  }

  String constructorNationalityFlag(String nationality) {
    switch (nationality) {
      case 'Swiss':
        return '🇨🇭';
      case 'British':
        return '🇬🇧';
      case 'French':
        return '🇫🇷';
      case 'German':
        return '🇩🇪';
      case 'American':
        return '🇺🇸';
      case 'Italian':
        return '🇮🇹';
      case 'Austrian':
        return '🇦🇹';
      default:
        return 'Country';
    }
  }

  String constructorImageUrl(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/alfa-romeo-logo.png.transform/2col-retina/image.png';
      case 'AlphaTauri':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/alphatauri-logo.png.transform/2col-retina/image.png';
      case 'Alpine F1 Team':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/alpine-logo.png.transform/2col-retina/image.png';
      case 'Aston Martin':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/aston-martin-logo.png.transform/2col-retina/image.png';
      case 'Ferrari':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/ferrari-logo.png.transform/2col-retina/image.png';
      case 'Haas F1 Team':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/haas-f1-team-logo.png.transform/2col-retina/image.png';
      case 'McLaren':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/mclaren-logo.png.transform/2col-retina/image.png';
      case 'Mercedes':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/mercedes-logo.png.transform/2col-retina/image.png';
      case 'Red Bull':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/red-bull-racing-logo.png.transform/2col-retina/image.png';
      case 'Williams':
        return 'https://media.formula1.com/content/dam/fom-website/teams/2023/williams-logo.png.transform/2col-retina/image.png';
      default:
        return 'Constructor';
    }
  }

  String constructorImageEXTUrl(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alfa%20romeo.jpg';
      case 'AlphaTauri':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alphatauri.jpg';
      case 'Alpine F1 Team':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/alpine.jpg';
      case 'Aston Martin':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/aston%20martin.jpg';
      case 'Ferrari':
        return 'https://media.formula1.com/content/dam/fom-website/teams/Ferrari/logo-ferrari-18%20.jpg';
      case 'Haas F1 Team':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/haas.jpg';
      case 'McLaren':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/mclaren.jpg';
      case 'Mercedes':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/mercedes.jpg';
      case 'Red Bull':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/red%20bull.jpg';
      case 'Williams':
        return 'https://media.formula1.com/content/dam/fom-website/2018-redesign-assets/team%20logos/williams.jpg';
      default:
        return 'Constructor';
    }
  }

  String constructorImageCarUrl(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alfa-romeo.png.transform/4col-retina/image.png';
      case 'AlphaTauri':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alphatauri.png.transform/4col-retina/image.png';
      case 'Alpine F1 Team':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/alpine.png.transform/4col-retina/image.png';
      case 'Aston Martin':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/aston-martin.png.transform/4col-retina/image.png';
      case 'Ferrari':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/ferrari.png.transform/4col-retina/image.png';
      case 'Haas F1 Team':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/haas-f1-team.png.transform/4col-retina/image.png';
      case 'McLaren':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mclaren.png.transform/4col-retina/image.png';
      case 'Mercedes':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/mercedes.png.transform/4col-retina/image.png';
      case 'Red Bull':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/red-bull-racing.png.transform/4col-retina/image.png';
      case 'Williams':
        return 'https://media.formula1.com/d_team_car_fallback_image.png/content/dam/fom-website/teams/2023/williams.png.transform/4col-retina/image.png';
      default:
        return 'Constructor';
    }
  }

  String constructorPowerUnit(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'Ferrari';
      case 'AlphaTauri':
        return 'Honda RBPT';
      case 'Alpine F1 Team':
        return 'Renault';
      case 'Aston Martin':
        return 'Mercedes';
      case 'Ferrari':
        return 'Ferrari';
      case 'Haas F1 Team':
        return 'Ferrari';
      case 'McLaren':
        return 'Mercedes';
      case 'Mercedes':
        return 'Mercedes';
      case 'Red Bull':
        return 'Honda RBPT';
      case 'Williams':
        return 'Mercedes';
      default:
        return 'Constructor';
    }
  }

  List<String> constructorDrivers(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return ['Zhou Guanyu', 'Valtteri Bottas'];
      case 'AlphaTauri':
        return ['Yuki Tsunoda', 'Nyck De Vries'];
      case 'Alpine F1 Team':
        return ['Pierre Gasly', 'Esteban Ocon'];
      case 'Aston Martin':
        return ['Lance Stroll', 'Fernando Alonso'];
      case 'Ferrari':
        return ['Charles Leclerc', 'Carlos Sainz'];
      case 'Haas F1 Team':
        return ['Kevin Magnussen', 'Nico Hulkenberg'];
      case 'McLaren':
        return ['Lando Norris', 'Oscar Piastri'];
      case 'Mercedes':
        return ['Lewis Hamilton', 'George Russell'];
      case 'Red Bull':
        return ['Max Verstappen', 'Sergio Perez'];
      case 'Williams':
        return ['Alexander Albon', 'Logan Sargeant'];
      default:
        return ['Driver 1', 'Driver 2'];
    }
  }

  List<String> constructorDriversID(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return ['zhou', 'bottas'];
      case 'AlphaTauri':
        return ['tsunoda', 'de_vries'];
      case 'Alpine F1 Team':
        return ['gasly', 'ocon'];
      case 'Aston Martin':
        return ['stroll', 'alonso'];
      case 'Ferrari':
        return ['leclerc', 'sainz'];
      case 'Haas F1 Team':
        return ['kevin_magnussen', 'hulkenberg'];
      case 'McLaren':
        return ['norris', 'piastri'];
      case 'Mercedes':
        return ['hamilton', 'russell'];
      case 'Red Bull':
        return ['max_verstappen', 'perez'];
      case 'Williams':
        return ['albon', 'sargeant'];
      default:
        return ['Driver 1', 'Driver 2'];
    }
  }

  String constructorFullName(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'Alfa Romeo F1 Team Stake';
      case 'AlphaTauri':
        return 'Scuderia AlphaTauri';
      case 'Alpine F1 Team':
        return 'BWT Alpine F1 Team';
      case 'Aston Martin':
        return 'Aston Martin Aramco Cognizant F1 Team';
      case 'Ferrari':
        return 'Scuderia Ferrari';
      case 'Haas F1 Team':
        return 'MoneyGram Haas F1 Team';
      case 'McLaren':
        return 'McLaren F1 Team';
      case 'Mercedes':
        return 'Mercedes-AMG PETRONAS F1 Team';
      case 'Red Bull':
        return 'Oracle Red Bull Racing';
      case 'Williams':
        return 'Williams Racing';
      default:
        return 'Team FullName';
    }
  }

  String constructorBase(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return 'Hinwil, Switzerland';
      case 'AlphaTauri':
        return 'Faenza, Italy';
      case 'Alpine F1 Team':
        return 'Enstone, United Kingdom';
      case 'Aston Martin':
        return 'Silverstone, United Kingdom';
      case 'Ferrari':
        return 'Maranello, Italy';
      case 'Haas F1 Team':
        return 'Kannapolis, United States';
      case 'McLaren':
        return 'Woking, United Kingdom';
      case 'Mercedes':
        return 'Brackley, United Kingdom';
      case 'Red Bull':
        return 'Milton Keynes, United Kingdom';
      case 'Williams':
        return 'Grove, United Kingdom';
      default:
        return 'Base';
    }
  }

  String constructorEntry(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return '1993';
      case 'AlphaTauri':
        return '1985';
      case 'Alpine F1 Team':
        return '1986';
      case 'Aston Martin':
        return '2018';
      case 'Ferrari':
        return '1950';
      case 'Haas F1 Team':
        return '2016';
      case 'McLaren':
        return '1966';
      case 'Mercedes':
        return '1970';
      case 'Red Bull':
        return '1997';
      case 'Williams':
        return '1978';
      default:
        return 'First Team Entry';
    }
  }

  Color constructorColor(String constructorName) {
    switch (constructorName) {
      case 'Alfa Romeo':
        return Color(0xFF930614);
      case 'AlphaTauri':
        return Color(0xFF314051);
      case 'Alpine F1 Team':
        return Color(0xFF056AAF);
      case 'Aston Martin':
        return Color(0xFF00594E);
      case 'Ferrari':
        return Color(0xFFCC151C);
      case 'Haas F1 Team':
        return Color(0xFF151212);
      case 'McLaren':
        return Color(0xFFFE9809);
      case 'Mercedes':
        return Color(0xFF00E0B2);
      case 'Red Bull':
        return Color(0xFF2b2c38);
      case 'Williams':
        return Color(0xFF0D3DAA);
      default:
        return Color(0xFFFE9809);
    }
  }
}

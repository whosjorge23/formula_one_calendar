import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/race.dart';

class RaceRepository {
  static const String _baseUrl = 'https://ergast.com/api/f1/2024.json';
  final Dio _dio;

  RaceRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Race>?> allRaces() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        RaceData raceDataResponse = RaceData.fromJson(response.data);
        return raceDataResponse.mrData?.raceTable?.races;
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return Future.delayed(const Duration(seconds: 10), allRaces);
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }

  Future<List<Circuit>?> circuitLocation() async {
    List<Circuit> circuitLocation = [];
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        RaceData raceDataResponse = RaceData.fromJson(response.data);
        for (var race in raceDataResponse.mrData!.raceTable!.races) {
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
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }
}

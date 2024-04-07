import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/result.dart';

class ResultRepository {
  static const String _baseUrl = 'https://ergast.com/api/f1/2024/3/results.json';
  final Dio _dio;

  ResultRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Race?> raceResults(int raceNumber) async {
    try {
      final response = await _dio.get("https://ergast.com/api/f1/2024/$raceNumber/results.json");
      if (response.statusCode == 200) {
        ResultData resultDataResponse = ResultData.fromJson(response.data);
        if (resultDataResponse.mrData?.raceTable?.races != null &&
            resultDataResponse.mrData!.raceTable!.races!.isNotEmpty) {
          return resultDataResponse.mrData!.raceTable!.races!.first;
        } else {
          return null;
        }
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }

  Future<List<Race>?> teamResults(String constructorId) async {
    try {
      final response = await _dio.get("https://ergast.com/api/f1/2024/constructors/$constructorId/results.json");
      if (response.statusCode == 200) {
        ResultData resultDataResponse = ResultData.fromJson(response.data);
        if (resultDataResponse.mrData?.raceTable?.races != null &&
            resultDataResponse.mrData!.raceTable!.races!.isNotEmpty) {
          return resultDataResponse.mrData!.raceTable!.races!;
        } else {
          return null;
        }
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }

  Future<List<Race>?> driverResults(String driverId) async {
    try {
      final response = await _dio.get("https://ergast.com/api/f1/2024/drivers/$driverId/results.json");
      if (response.statusCode == 200) {
        ResultData resultDataResponse = ResultData.fromJson(response.data);
        if (resultDataResponse.mrData?.raceTable?.races != null &&
            resultDataResponse.mrData!.raceTable!.races!.isNotEmpty) {
          return resultDataResponse.mrData!.raceTable!.races!;
        } else {
          return null;
        }
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

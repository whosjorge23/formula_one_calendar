import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/driver.dart';

class DriverRepository {
  static const String _baseUrl = 'https://ergast.com/api/f1/2024/drivers.json';
  final Dio _dio;

  DriverRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Driver>?> fetchDrivers() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        DriverData raceDataResponse = DriverData.fromJson(response.data);
        return raceDataResponse.mrData?.driverTable?.drivers;
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return Future.delayed(const Duration(seconds: 10), fetchDrivers);
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }

  Future<Driver?> fetchDriver(String driverID) async {
    try {
      final response = await _dio.get('https://ergast.com/api/f1/drivers/$driverID.json');
      if (response.statusCode == 200) {
        DriverData raceDataResponse = DriverData.fromJson(response.data);
        return raceDataResponse.mrData?.driverTable?.drivers?.first;
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return Future.delayed(const Duration(seconds: 10), () {
          fetchDriver(driverID);
        });
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }
}

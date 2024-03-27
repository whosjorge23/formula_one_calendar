import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/constructor.dart';

class ConstructorRepository {
  static const String _baseUrl = 'https://ergast.com/api/f1/2024/constructors.json';
  final Dio _dio;

  ConstructorRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Constructors>?> fetchConstructors() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        ConstructorData raceDataResponse = ConstructorData.fromJson(response.data);
        return raceDataResponse.mrData?.constructorTable?.constructors;
      } else {
        debugPrint("Error: Failed to load characters, status code: ${response.statusCode}");
        return Future.delayed(const Duration(seconds: 10), fetchConstructors);
      }
    } catch (e) {
      debugPrint("Exception: ${e.toString()}");
      return null;
    }
  }
}

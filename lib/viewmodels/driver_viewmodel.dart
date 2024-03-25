import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:http/http.dart' as http;

import '../models/constructor.dart';

class DriversViewModel {
  List<Driver> drivers = [];
  Driver? driver;

  Future<List<Driver>?> fetchDrivers() async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/2023/drivers.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = DriverData.fromJson(jsonData);
      drivers = result.mrData?.driverTable?.drivers ?? [];
      return drivers;
    } else {
      Future.delayed(const Duration(seconds: 10), fetchDrivers);
    }
  }

  Future<Driver?> fetchDriver(String driverID) async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/drivers/$driverID.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = DriverData.fromJson(jsonData);
      driver = result.mrData?.driverTable?.drivers?.first;
      return driver;
    } else {
      Future.delayed(const Duration(seconds: 10), () => fetchDriver(driverID));
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/constructor.dart';

class ConstructorsViewModel {
  List<Constructors> constructors = [];

  Future<List<Constructors>?> fetchConstructors() async {
    final response = await http.get(Uri.parse('https://ergast.com/api/f1/2024/constructors.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final result = ConstructorData.fromJson(jsonData);
      constructors = result.mrData?.constructorTable?.constructors ?? [];
      return constructors;
    } else {
      Future.delayed(const Duration(seconds: 10), fetchConstructors);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_one_calendar/network/constructor_repository.dart';
import 'package:formula_one_calendar/network/driver_repository.dart';
import 'package:formula_one_calendar/network/race_repository.dart';
import 'package:formula_one_calendar/network/result_repository.dart';
import 'package:formula_one_calendar/service/context_service.dart';
import 'package:formula_one_calendar/service/shared_preferences_service.dart';
import 'package:formula_one_calendar/theme/app_colors.dart';
import 'package:formula_one_calendar/theme/app_text_styles.dart';

import 'package:get_it/get_it.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerSingletons();

  setDeviceOrientation();
}

/// Create singletons (services) that can be shared across the app.
void _registerSingletons() {
  final contextService = ContextService();
  // Global Context
  GetIt.I.registerSingleton<ContextService>(contextService);

  GetIt.I.registerLazySingleton<SharedPreferenceService>(() => SharedPreferenceService());

  //NetworkClient

  // RouteObserver
  GetIt.I.registerSingleton(RouteObserver<ModalRoute<void>>());

  //Repositories
  GetIt.I.registerSingleton<RaceRepository>(RaceRepository());
  GetIt.I.registerSingleton<ConstructorRepository>(ConstructorRepository());
  GetIt.I.registerSingleton<DriverRepository>(DriverRepository());
  GetIt.I.registerSingleton<ResultRepository>(ResultRepository());

  //Services
  GetIt.I.registerLazySingleton<AppTextStyle>(() => AppTextStyle());
  GetIt.I.registerLazySingleton<AppColors>(() => AppColors());
}

void setDeviceOrientation() {
  final orientations = <DeviceOrientation>[];

  orientations.addAll([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setPreferredOrientations(orientations);
}

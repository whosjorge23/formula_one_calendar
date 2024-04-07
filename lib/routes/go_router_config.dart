import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/circuits/circuit_map_screen.dart';
import 'package:formula_one_calendar/features/circuits/cubit/circuit_cubit.dart';
import 'package:formula_one_calendar/features/constructors/constructor_details_screen.dart';
import 'package:formula_one_calendar/features/constructors/constructors_screen.dart';
import 'package:formula_one_calendar/features/constructors/cubit/constructor_cubit.dart';
import 'package:formula_one_calendar/features/drivers/cubit/driver_cubit.dart';
import 'package:formula_one_calendar/features/drivers/driver_screen.dart';
import 'package:formula_one_calendar/features/races/cubit/race_cubit.dart';
import 'package:formula_one_calendar/features/races/race_details_screen.dart';
import 'package:formula_one_calendar/features/races/race_list_screen.dart';
import 'package:formula_one_calendar/features/results/cubit/result_cubit.dart';
import 'package:formula_one_calendar/features/results/result_details_screen.dart';
import 'package:formula_one_calendar/features/results/result_list_screen.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/models/result.dart' as resultModel;
import 'package:formula_one_calendar/shell/cubit/home_screen_shell_cubit.dart';
import 'package:formula_one_calendar/shell/home_screen_shell.dart';

import 'package:formula_one_calendar/views/credits_view.dart';

import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String raceList = '/raceList';
  static String raceDetails = '/raceDetails';
  static String circuitMap = '/circuitMap';
  static String constructorList = '/constructorList';
  static String constructorDetails = '/constructorDetails';
  static String driverDetails = '/driverDetails';
  static String resultList = '/resultList';
  static String resultDetails = '/resultDetails';
  static String credits = '/credits';
}

NoTransitionPage pageBuilder(Widget widget) {
  return NoTransitionPage(child: widget);
}

GoRouter createGoRouter({
  required GlobalKey<NavigatorState> navigatorKey,
}) {
  final GlobalKey<NavigatorState> homeScreenShellKey = GlobalKey<NavigatorState>(debugLabel: 'homeScreenShellKey');
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: ScreenPaths.raceList,
    routes: [
      ShellRoute(
        navigatorKey: homeScreenShellKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: BlocProvider(
              create: (context) => HomeScreenShellCubit(),
              child: HomeScreenShell(
                child: child,
              ),
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: ScreenPaths.raceList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlocProvider(
                  create: (context) => RaceCubit()..getRaces(),
                  child: RaceListScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.circuitMap,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlocProvider(
                  create: (context) => CircuitCubit(),
                  child: CircuitMapScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.constructorList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlocProvider(
                  create: (context) => ConstructorCubit()..getConstructors(),
                  child: ConstructorsScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.resultList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlocProvider(
                  create: (context) => ResultCubit()..getAllRacesResults(),
                  child: ResultListScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.credits,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CreditsView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: ScreenPaths.raceDetails,
        pageBuilder: (context, state) {
          Race raceDetails = state.extra as Race;
          return NoTransitionPage(
            child: RaceDetailsScreen(
              race: raceDetails,
            ),
          );
        },
      ),
      GoRoute(
        path: ScreenPaths.constructorDetails,
        pageBuilder: (context, state) {
          Constructors constructorDetails = state.extra as Constructors;
          return NoTransitionPage(
            child: BlocProvider(
              create: (context) => ConstructorCubit(),
              child: ConstructorDetailsScreen(
                constructor: constructorDetails,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: ScreenPaths.driverDetails,
        pageBuilder: (context, state) {
          Map<String, Object?> driverDetails = state.extra as Map<String, Object?>;
          return NoTransitionPage(
            child: BlocProvider(
              create: (context) => DriverCubit(),
              child: DriverDetailsScreen(
                selectedDriver: driverDetails['selectedDriver']! as String,
                constructorColor: driverDetails['constructorColor']! as Color,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: ScreenPaths.resultDetails,
        pageBuilder: (context, state) {
          Map<String, Object?> resultDetails = state.extra as Map<String, Object?>;
          return NoTransitionPage(
            child: BlocProvider(
              create: (context) => DriverCubit(),
              child: ResultDetailsScreen(
                resultDetails: resultDetails['resultDetails'] as List<resultModel.Result>,
                raceName: resultDetails['raceName']! as String,
              ),
            ),
          );
        },
      ),
    ],
    debugLogDiagnostics: true,
  );
}

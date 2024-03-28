import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/shell/cubit/home_screen_shell_cubit.dart';
import 'package:formula_one_calendar/shell/home_screen_shell.dart';
import 'package:formula_one_calendar/views/circuit_map_view.dart';
import 'package:formula_one_calendar/views/constructors_view.dart';
import 'package:formula_one_calendar/views/credits_view.dart';
import 'package:formula_one_calendar/views/race_list_view.dart';

import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String raceList = '/raceList';
  static String circuitMap = '/circuitMap';
  static String constructorList = '/constructorList';
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
                child: RaceListView(),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.circuitMap,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CircuitMapView(),
              );
            },
          ),
          GoRoute(
            path: ScreenPaths.constructorList,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ConstructorsView(),
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
    ],
    debugLogDiagnostics: true,
  );
}

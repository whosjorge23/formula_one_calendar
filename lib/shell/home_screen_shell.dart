import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/shell/cubit/home_screen_shell_cubit.dart';
import 'package:go_router/go_router.dart';

class HomeScreenShell extends StatefulWidget {
  const HomeScreenShell({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<HomeScreenShell> createState() => _HomeScreenShellState();
}

class _HomeScreenShellState extends State<HomeScreenShell> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index, BuildContext context) {
    if (index == 0) {
      context.go(ScreenPaths.raceList);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
    if (index == 1) {
      context.go(ScreenPaths.circuitMap);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
    if (index == 2) {
      context.go(ScreenPaths.constructorList);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
    if (index == 3) {
      context.go(ScreenPaths.resultList);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
    if (index == 4) {
      context.go(ScreenPaths.settings);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
  }

  BottomNavigationBarItem bottomNavigationBarItem(IconData iconData, String imageUrl, String label) {
    return BottomNavigationBarItem(
      activeIcon: Column(
        children: [
          // Icon(
          //   iconData,
          //   color: appColors.redFerrari,
          // ),
          Image.asset(
            imageUrl,
            color: appColors.redFerrari,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: appTextStyle.getFormulaOne().copyWith(fontSize: 10, color: appColors.redFerrari),
          )
        ],
      ),
      icon: Column(
        children: [
          // Icon(
          //   iconData,
          //   color: appColors.greyHaas,
          // ),
          Image.asset(
            imageUrl,
            color: appColors.greyHaas,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: appTextStyle.getFormulaOne().copyWith(fontSize: 10, color: appColors.greyHaas),
          )
        ],
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenShellCubit = context.watch<HomeScreenShellCubit>().state;
    return homeScreenShellCubit.when(
      initial: (
        selectedIndex,
      ) {
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              bottomNavigationBarItem(
                Icons.flag_outlined,
                "assets/icons/start.png",
                context.l10n.races,
              ),
              bottomNavigationBarItem(
                Icons.map_outlined,
                "assets/icons/maps.png",
                context.l10n.map,
              ),
              bottomNavigationBarItem(
                Icons.drive_eta,
                "assets/icons/formula-one.png",
                context.l10n.teams,
              ),
              bottomNavigationBarItem(
                Icons.list,
                "assets/icons/trophy.png",
                context.l10n.results,
              ),
              bottomNavigationBarItem(
                Icons.person,
                "assets/icons/driver.png",
                context.l10n.settings,
              ),
            ],
            currentIndex: selectedIndex,
            onTap: (index) => _onItemTapped(index, context),
          ),
        );
      },
    );
  }
}

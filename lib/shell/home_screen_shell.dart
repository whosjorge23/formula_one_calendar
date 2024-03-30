import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
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
      context.go(ScreenPaths.credits);
      context.read<HomeScreenShellCubit>().updateIndex(index);
    }
  }

  BottomNavigationBarItem bottomNavigationBarItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      activeIcon: Column(
        children: [
          Icon(
            iconData,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      icon: Column(
        children: [
          Icon(
            iconData,
            color: Colors.black45,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black45),
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
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              bottomNavigationBarItem(
                Icons.flag_outlined,
                'Races\n',
              ),
              bottomNavigationBarItem(
                Icons.map_outlined,
                'Map\n',
              ),
              bottomNavigationBarItem(
                Icons.drive_eta,
                'Teams\n',
              ),
              bottomNavigationBarItem(
                Icons.person,
                'Credits\n',
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
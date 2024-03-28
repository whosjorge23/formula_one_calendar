import 'package:flutter/material.dart';
import 'package:formula_one_calendar/app.dart';
import 'package:formula_one_calendar/bootstrap.dart';
import 'package:formula_one_calendar/views/circuit_map_view.dart';
import 'package:formula_one_calendar/views/constructors_view.dart';
import 'package:formula_one_calendar/views/credits_view.dart';
import 'package:formula_one_calendar/views/race_list_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  bootstrap();
  runApp(const MainApp());
  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Formula One Races',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var _currentIndex = 0;
//
//   List<Widget> pageList = [
//     RaceListView(),
//     CircuitMapView(),
//     ConstructorsView(),
//     CreditsView(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       body: pageList[_currentIndex],
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: _currentIndex,
//         onTap: (i) => setState(() => _currentIndex = i),
//         items: [
//           /// Home
//           SalomonBottomBarItem(
//             icon: Icon(Icons.flag_outlined),
//             title: Text("Races"),
//             selectedColor: Colors.purple,
//           ),
//
//           /// Likes
//           SalomonBottomBarItem(
//             icon: Icon(Icons.map_outlined),
//             title: Text("Map"),
//             selectedColor: Colors.pink,
//           ),
//
//           /// Search
//           SalomonBottomBarItem(
//             icon: Icon(Icons.drive_eta),
//             title: Text("Teams"),
//             selectedColor: Colors.orange,
//           ),
//
//           /// Profile
//           SalomonBottomBarItem(
//             icon: Icon(Icons.person),
//             title: Text("Credits"),
//             selectedColor: Colors.teal,
//           ),
//         ],
//       ),
//     );
//   }
// }

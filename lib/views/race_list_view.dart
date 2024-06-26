// import 'package:flutter/material.dart';
// import 'package:formula_one_calendar/models/race.dart';
// import 'package:formula_one_calendar/network/race_repository.dart';
// import 'package:formula_one_calendar/shared_export.dart';
// import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
// import 'package:formula_one_calendar/views/race_details.dart';
//
// class RaceListView extends StatefulWidget {
//   @override
//   _RaceListViewState createState() => _RaceListViewState();
// }
//
// class _RaceListViewState extends State<RaceListView> {
//   List<Race>? races;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchRaces();
//   }
//
//   void fetchRaces() async {
//     // Make sure to update the state once data is fetched.
//     races = await raceRepository.allRaces();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Races List'),
//       ),
//       body: FutureBuilder<List<Race>?>(
//           future: raceRepository.allRaces(),
//           // assuming fetchRaces() is a function that returns Future<List<Race>>
//           builder: (BuildContext context, AsyncSnapshot<List<Race>?> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   var race = snapshot.data![index];
//                   return ListTile(
//                     title: Text("${race.raceName}", style: TextStyle(fontWeight: FontWeight.bold)),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Race ${race.getDateFormatted ?? "-"} at ${race.getTimeGMT ?? "-"}"),
//                                 Text(
//                                     "Circuit ${race.circuit?.circuitName}\nPlace ${race.circuit?.location?.locality}, ${race.circuit?.location?.country} ${race.circuit?.location!.getCountryFlag ?? "-"}"),
//                               ],
//                             ),
//                             // Text("**Round** ${race.round}", style: TextStyle(fontSize: 24)),
//                             Text("${race.round}", style: TextStyle(fontSize: 24)),
//                           ],
//                         ),
//                       ],
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RaceDetailsView(race: race)),
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//           }),
//     );
//   }
// }

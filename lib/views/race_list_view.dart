import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/race_data.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:formula_one_calendar/views/race_details.dart';

class RaceListView extends StatefulWidget {
  @override
  _RaceListViewState createState() => _RaceListViewState();
}

class _RaceListViewState extends State<RaceListView> {
  RaceListViewModel viewModel = RaceListViewModel();
  List<Race>? races;

  @override
  void initState() {
    super.initState();
    fetchRaces();
  }

  void fetchRaces() async {
    // TODO: implement fetchRaces() function here.
    // Make sure to update the state once data is fetched.
    races = await viewModel.fetchRaces();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Races'),
      // ),
      body: (races != null) ? ListView.builder(
        itemCount: races!.length,
        itemBuilder: (context, index) {
          var race = races![index];
          return ListTile(
            title: Text("**${race.raceName}**", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("**Race** ${viewModel.formatDate(race.date)} at ${viewModel.formatTimeInGMT(race.time)}"),
                Text("**Circuit** ${race.circuit.circuitName}\n**Place** ${race.circuit.location.locality}, ${race.circuit.location.country} ${viewModel.countryFlag(race.circuit.location.country)}"),
                Text("**Round** ${race.round}", style: TextStyle(fontSize: 24)),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RaceDetailsView(race: race)),
              );
            },
          );
        },
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}

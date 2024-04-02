import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/races/cubit/race_cubit.dart';
import 'package:formula_one_calendar/features/races/race_details_screen.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/network/race_repository.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:formula_one_calendar/views/race_details.dart';
import 'package:formula_one_calendar/widgets/circuit_card.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class RaceListScreen extends StatefulWidget {
  @override
  _RaceListScreenState createState() => _RaceListScreenState();
}

class _RaceListScreenState extends State<RaceListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaceCubit, RaceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Races List'),
          ),
          body: state.races != null
              ? ListView.builder(
                  itemCount: state.races?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(ScreenPaths.raceDetails, extra: state.races![index]);
                      },
                      child: CircuitCard(
                        circuitName: "${state.races?[index].raceName}",
                        circuitPlace:
                            '${state.races?[index].circuit?.location?.locality}, ${state.races?[index].circuit?.location?.country} ${state.races?[index].circuit?.location!.getCountryFlag ?? "-"}',
                        circuitTrackName: '${state.races?[index].circuit?.circuitName}',
                        trackPic: '${state.races?[index].circuit?.getCircuitPic}',
                        trackSchedule:
                            '${state.races?[index].getDateFormatted ?? "-"} at ${state.races?[index].getTimeGMT ?? "-"}',
                        circuitRound: '${state.races?[index].round}',
                      ),
                    );
                    // return ListTile(
                    //   title: Text("${state.races?[index].raceName}", style: TextStyle(fontWeight: FontWeight.bold)),
                    //   subtitle: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                   "Race ${state.races?[index].getDateFormatted ?? "-"} at ${state.races?[index].getTimeGMT ?? "-"}"),
                    //               Text(
                    //                   "Circuit ${state.races?[index].circuit?.circuitName}\nPlace ${state.races?[index].circuit?.location?.locality}, ${state.races?[index].circuit?.location?.country} ${state.races?[index].circuit?.location!.getCountryFlag ?? "-"}"),
                    //             ],
                    //           ),
                    //           Text("${state.races?[index].round}", style: TextStyle(fontSize: 24)),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     context.push(ScreenPaths.raceDetails, extra: state.races![index]);
                    //   },
                    // );
                  },
                )
              : Center(
                  child: Lottie.asset(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.height * 0.20,
                      'assets/lottie/loader_f1.json'),
                ),
        );
      },
    );
  }
}

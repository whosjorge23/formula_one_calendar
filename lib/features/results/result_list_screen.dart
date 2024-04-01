import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/races/cubit/race_cubit.dart';
import 'package:formula_one_calendar/features/races/race_details_screen.dart';
import 'package:formula_one_calendar/features/results/cubit/result_cubit.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/models/result.dart';
import 'package:formula_one_calendar/network/race_repository.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:formula_one_calendar/views/race_details.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ResultListScreen extends StatefulWidget {
  @override
  _ResultListScreenState createState() => _ResultListScreenState();
}

class _ResultListScreenState extends State<ResultListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, ResultState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Result List'),
          ),
          body: state.raceResults != null
              ? ListView.builder(
                  itemCount: state.raceResults?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${state.raceResults?[index].raceName}", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("${state.raceResults?[index].round}", style: TextStyle(fontSize: 24)),
                        ],
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Winner: ${state.raceResults?[index].results?.first.driver?.familyName ?? "-"} ${state.raceResults?[index].results?.first.constructor?.name ?? "-"}"),
                              // Image.network(state.raceResults?[index].results?.first.driver?.getDriverHelmetPic)
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        context.push(ScreenPaths.resultDetails, extra: {
                          'raceName': state.raceResults?[index].raceName,
                          'resultDetails': state.raceResults?[index].results
                        });
                      },
                    );
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

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
import 'package:formula_one_calendar/widgets/circuit_card.dart';
import 'package:formula_one_calendar/widgets/result_driver_card.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ResultDetailsScreen extends StatelessWidget {
  ResultDetailsScreen({required this.resultDetails, required this.raceName});

  final List<Result>? resultDetails;
  final String raceName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(raceName),
      ),
      body: resultDetails != null
          ? ListView.builder(
              itemCount: resultDetails?.length,
              itemBuilder: (context, index) {
                return ResultDriverCard(
                  driverName:
                      '${resultDetails?[index].driver?.givenName ?? "-"} ${resultDetails?[index].driver?.familyName ?? "-"}',
                  teamName: '${resultDetails?[index].constructor?.name ?? "-"}',
                  pointsDriver: '${resultDetails?[index].points ?? "-"}',
                  driverCardPic: resultDetails?[index].driver!.getDriverCardPic ?? "",
                  driverStatus: '${resultDetails?[index].status ?? "-"}',
                  circuitRound: '${resultDetails?[index].position}',
                  helmetPic: resultDetails?[index].driver!.getDriverHelmetPic ?? "",
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
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/results/cubit/result_cubit.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/widgets/result_card.dart';
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
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Result List'),
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                  width: 4.0,
                  color: appColors.redFerrari,
                )),
                unselectedLabelColor: appColors.greyHaas,
                unselectedLabelStyle: appTextStyle.getFormulaOne(),
                labelColor: appColors.redFerrari,
                labelStyle: appTextStyle.getFormulaOne(),
                tabs: [
                  Tab(text: "Races"),
                  Tab(text: "Teams"),
                  Tab(text: "Drivers"),
                ],
              ),
            ),
            body: state.raceResults != null
                ? TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: state.raceResults?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(ScreenPaths.resultDetails, extra: {
                                'raceName': state.raceResults?[index].raceName,
                                'resultDetails': state.raceResults?[index].results
                              });
                            },
                            child: ResultCard(
                              raceName: '${state.raceResults?[index].raceName}',
                              circuitName: '${state.raceResults?[index].circuit?.circuitName}',
                              teamName: '${state.raceResults?[index].results?.first.constructor?.name ?? "-"}',
                              trackPic: '${state.raceResults?[index].circuit?.getCircuitPic}',
                              driverName:
                                  '${state.raceResults?[index].results?.first.driver?.givenName ?? "-"} ${state.raceResults?[index].results?.first.driver?.familyName ?? "-"} ${state.raceResults?[index].results?.first.driver?.permanentNumber ?? "-"}',
                              circuitRound: '${state.raceResults?[index].round}',
                              teamCar:
                                  '${state.raceResults?[index].results?.first.constructor?.getConstructorCarImage ?? "-"}',
                            ),
                          );
                        },
                      ),
                      Center(
                        child: Text(
                          "Teams",
                          style: appTextStyle.getQuicksand().copyWith(color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Drivers",
                          style: appTextStyle.getQuicksand().copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Lottie.asset(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.20,
                        'assets/lottie/loader_f1.json'),
                  ),
          ),
        );
      },
    );
  }
}

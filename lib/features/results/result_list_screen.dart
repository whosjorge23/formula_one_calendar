import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/results/cubit/result_cubit.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/widgets/result_card.dart';
import 'package:formula_one_calendar/widgets/result_driver_card.dart';
import 'package:formula_one_calendar/widgets/team_card.dart';
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
              title: Text(context.l10n.result_list),
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
                  Tab(text: context.l10n.races),
                  Tab(text: context.l10n.teams),
                  Tab(text: context.l10n.drivers),
                ],
              ),
            ),
            body: state.raceResults != null && state.teamsResults != null && state.driversResults != null
                ? TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //RACES START
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
                      //RACES END
                      //TEAMS START
                      ListView.builder(
                        itemCount: state.teamsResults?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(ScreenPaths.constructorDetails,
                                  extra: state.teamsResults?[index].constructors);
                            },
                            child: TeamCard(
                              teamColor: state.teamsResults?[index].constructors?.getConstructorColor ?? Colors.white,
                              teamName: state.teamsResults?[index].constructors?.name ?? "-",
                              teamNationality:
                                  '${state.teamsResults?[index].constructors?.nationality} ${state.teamsResults?[index].constructors?.getConstructorFlag}',
                              teamPowerUnit: '${state.teamsResults?[index].constructors?.getConstructorPowerUnit}',
                              teamLogo: state.teamsResults![index].constructors!.getConstructorImage,
                              teamCar: state.teamsResults![index].constructors!.getConstructorCarImage,
                              teamDrivers: 'Pt. ${state.teamsResults?[index].constructorsResult}',
                            ),
                          );
                        },
                      ),
                      //TEAMS END
                      //DRIVERS START
                      ListView.builder(
                        itemCount: state.driversResults?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                context.push(ScreenPaths.driverDetails, extra: {
                                  "selectedDriver": state.driversResults?[index].driver?.driverId,
                                  "constructorColor": state.driversResults?[index].constructor?.getConstructorColor,
                                });
                              },
                              child: ResultDriverCard(
                                driverName:
                                    '${state.driversResults?[index].driver?.givenName ?? "-"} ${state.driversResults?[index].driver?.familyName ?? "-"}',
                                teamName:
                                    '${state.driversResults?[index].driver?.code ?? "-"} ${state.driversResults?[index].driver?.permanentNumber ?? "-"} - ${state.driversResults?[index].driver?.nationality ?? "-"} ${state.driversResults?[index].driver?.getDriverFlag ?? "-"}',
                                pointsDriver: 'Pt. ${state.driversResults?[index].driverResult ?? "-"}',
                                driverCardPic: state.driversResults?[index].driver!.getDriverCardPic ?? "",
                                helmetPic: state.driversResults?[index].driver!.getDriverHelmetPic ?? "",
                                driverStatus: state.driversResults?[index].constructor?.name ?? "",
                                circuitRound: '${index + 1}',
                              ));
                        },
                      ),
                      //DRIVERS END
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

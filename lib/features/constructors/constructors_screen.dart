import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/constructors/cubit/constructor_cubit.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/views/constructor_details_view.dart';
import 'package:formula_one_calendar/widgets/team_card.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ConstructorsScreen extends StatefulWidget {
  @override
  State<ConstructorsScreen> createState() => _ConstructorsScreenState();
}

class _ConstructorsScreenState extends State<ConstructorsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConstructorCubit, ConstructorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.teams_list),
          ),
          body: state.constructors != null
              ? ListView.builder(
                  itemCount: state.constructors?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: TeamCard(
                        teamColor: state.constructors?[index].getConstructorColor ?? Colors.white,
                        teamName: state.constructors?[index].name ?? "-",
                        teamNationality:
                            '${state.constructors?[index].getConstructorNationalityTranslation} ${state.constructors?[index].getConstructorFlag}',
                        teamPowerUnit: '${state.constructors?[index].getConstructorPowerUnit}',
                        teamLogo: state.constructors![index].getConstructorImage,
                        teamCar: state.constructors![index].getConstructorCarImage,
                        teamDrivers:
                            '${state.constructors?[index].getConstructorDrivers[0]}\n${state.constructors?[index].getConstructorDrivers[1]}',
                      ),
                      onTap: () {
                        context.push(ScreenPaths.constructorDetails, extra: state.constructors?[index]);
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

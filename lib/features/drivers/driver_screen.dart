import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/drivers/cubit/driver_cubit.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:formula_one_calendar/network/driver_repository.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:lottie/lottie.dart';

class DriverDetailsScreen extends StatefulWidget {
  final String selectedDriver;
  final Color constructorColor;

  DriverDetailsScreen({required this.selectedDriver, required this.constructorColor});

  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  @override
  void initState() {
    super.initState();
    fetchDriver();
  }

  void fetchDriver() async {
    if (!context.mounted) return;
    await context.read<DriverCubit>().getDriver(widget.selectedDriver);
    if (!context.mounted) return;
    await context.read<DriverCubit>().getDriverResults(widget.selectedDriver);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverCubit, DriverState>(
      builder: (context, state) {
        return state.driver != null
            ? Scaffold(
                appBar: AppBar(
                  title: Text("${state.driver!.givenName} ${state.driver!.familyName}"),
                  backgroundColor: widget.constructorColor,
                ),
                // backgroundColor: Colors.black,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(
                        state.driver!.getDriverPic,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: Lottie.asset(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.height * 0.20,
                                'assets/lottie/loader_f1.json'),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                      ),
                      // Display driver information
                      Text("${context.l10n.number}: ${state.driver!.permanentNumber}",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(
                          "${context.l10n.name}: ${state.driver!.givenName} ${state.driver!.familyName} ${state.driver!.code}",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(
                          "${context.l10n.nationality}: ${state.driver!.getDriverNationalityTranslation} ${state.driver!.getDriverFlag ?? "-"}",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("${context.l10n.dob}: ${state.driver!.dateOfBirth}",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("${context.l10n.points}: ${state.driverPoints}",
                          style: Theme.of(context).textTheme.titleLarge),
                      // Display driver helmet
                      Image.network(
                        state.driver!.getDriverHelmetPic,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: Lottie.asset(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.height * 0.20,
                                'assets/lottie/loader_f1.json'),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Lottie.asset(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.height * 0.20,
                    'assets/lottie/loader_f1.json'),
              );
      },
    );
  }
}

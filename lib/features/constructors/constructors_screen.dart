import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/constructors/cubit/constructor_cubit.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/views/constructor_details_view.dart';
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
            title: Text('Teams List'),
          ),
          body: state.constructors != null
              ? ListView.builder(
                  itemCount: state.constructors?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.constructors?[index].name ?? "-",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Nationality: ${state.constructors?[index].nationality} ${state.constructors?[index].getConstructorFlag}'),
                          Text('Power Unit: ${state.constructors?[index].getConstructorPowerUnit}'),
                          Text(
                              'Drivers: ${state.constructors?[index].getConstructorDrivers[0]} - ${state.constructors?[index].getConstructorDrivers[1]}'),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          state.constructors![index].getConstructorImage,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ConstructorDetailsView(constructor: constructor),
                        //   ),
                        // );
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

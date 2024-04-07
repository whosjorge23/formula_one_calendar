import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/constructors/cubit/constructor_cubit.dart';
import 'package:formula_one_calendar/features/constructors/cubit/constructor_cubit.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:formula_one_calendar/routes/go_router_config.dart';
import 'package:go_router/go_router.dart';

class ConstructorDetailsScreen extends StatefulWidget {
  final Constructors constructor;

  const ConstructorDetailsScreen({Key? key, required this.constructor}) : super(key: key);

  @override
  ConstructorDetailsScreenState createState() => ConstructorDetailsScreenState();
}

class ConstructorDetailsScreenState extends State<ConstructorDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConstructorPoints();
  }

  Future<void> getConstructorPoints() async {
    await context.read<ConstructorCubit>().getConstructorResults(widget.constructor.constructorId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConstructorCubit, ConstructorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.constructor.name ?? "-"),
            backgroundColor: widget.constructor.getConstructorColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    widget.constructor.getConstructorImageEXT,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                  Text('Full Team Name: ${widget.constructor.getConstructorFullname ?? "-"}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Nationality: ${widget.constructor.nationality} ${widget.constructor.getConstructorFlag}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Base: ${widget.constructor.getConstructorBase ?? "-"}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Power Unit: ${widget.constructor.getConstructorPowerUnit}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('First Team Entry: ${widget.constructor.getConstructorEntryYear ?? "-"}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('Points: ${state.constructorsPoints ?? "-"}', style: Theme.of(context).textTheme.titleLarge),
                  Text('Drivers: ', style: Theme.of(context).textTheme.titleLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DriverButton(
                        constructor: widget.constructor,
                        driverNum: 0,
                        isFlipped: true,
                      ),
                      DriverButton(
                        constructor: widget.constructor,
                        driverNum: 1,
                        isFlipped: false,
                      ),
                    ],
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      widget.constructor.getConstructorCarImage,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DriverButton extends StatelessWidget {
  const DriverButton({
    super.key,
    required this.constructor,
    required this.driverNum,
    required this.isFlipped,
  });

  final Constructors constructor;
  final int driverNum;
  final bool isFlipped;

  String getDriverPic() {
    Driver driver = Driver(driverId: constructor.getConstructorDriversID[driverNum]);
    return driver.getDriverCardPic;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Column(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(isFlipped ? pi : 0),
            child: Image.network(
              getDriverPic(),
              scale: 2,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
            ),
          ),
          Text(constructor.getConstructorDrivers[driverNum], style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      onPressed: () {
        context.push(ScreenPaths.driverDetails, extra: {
          "selectedDriver": constructor.getConstructorDriversID[driverNum],
          "constructorColor": constructor.getConstructorColor,
        });
      },
    );
  }
}

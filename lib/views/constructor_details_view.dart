import 'package:flutter/material.dart';
import 'package:formula_one_calendar/viewmodels/constructor_viewmodel.dart';

import '../models/constructor_data.dart';
import 'driver_view.dart';

class ConstructorDetailsView extends StatefulWidget {
  final Constructors constructor;

  const ConstructorDetailsView({Key? key, required this.constructor})
      : super(key: key);

  @override
  ConstructorDetailsViewState createState() => ConstructorDetailsViewState();
}

class ConstructorDetailsViewState extends State<ConstructorDetailsView> {
  ConstructorsViewModel viewModel = ConstructorsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.constructor.name),
        backgroundColor: viewModel.constructorColor(widget.constructor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              viewModel.constructorImageEXTUrl(widget.constructor.name),
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),

            Text(
                'Full Team Name: ${viewModel.constructorFullName(widget.constructor.name)}',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                'Nationality: ${widget.constructor.nationality} ${viewModel.constructorNationalityFlag(widget.constructor.nationality)}',
                style: Theme.of(context).textTheme.titleLarge),
            Text('Base: ${viewModel.constructorBase(widget.constructor.name)}',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                'Power Unit: ${viewModel.constructorPowerUnit(widget.constructor.name)}',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                'First Team Entry: ${viewModel.constructorEntry(widget.constructor.name)}',
                style: Theme.of(context).textTheme.titleLarge),
            Text('Drivers: ', style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: [
                DriverButton(
                    viewModel: viewModel,
                    constructor: widget.constructor,
                    driverNum: 0),
                DriverButton(
                    viewModel: viewModel,
                    constructor: widget.constructor,
                    driverNum: 1),
                // TextButton(
                //   child: Text(
                //       '${viewModel.constructorDrivers(widget.constructor.name)[1]}',
                //       style: Theme.of(context).textTheme.headline6),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => DriverDetailsView(
                //             selectedDriver: viewModel.constructorDriversID(
                //                 widget.constructor.name)[1]),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
            // Text('Car', style: Theme
            //     .of(context)
            //     .textTheme
            //     .headline6),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                viewModel.constructorImageCarUrl(widget.constructor.name),
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverButton extends StatelessWidget {
  const DriverButton({
    super.key,
    required this.viewModel,
    required this.constructor,
    required this.driverNum,
  });

  final ConstructorsViewModel viewModel;
  final Constructors constructor;
  final int driverNum;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(viewModel.constructorDrivers(constructor.name)[driverNum],
          style: Theme.of(context).textTheme.titleLarge),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverDetailsView(
              selectedDriver:
                  viewModel.constructorDriversID(constructor.name)[driverNum],
              constructorColor: viewModel.constructorColor(constructor.name),
            ),
          ),
        );
      },
    );
  }
}

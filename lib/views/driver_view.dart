import 'package:flutter/material.dart';

import '../models/driver_data.dart';
import '../viewmodels/driver_viewmodel.dart';

class DriverDetailsView extends StatefulWidget {
  final String selectedDriver;
  final Color constructorColor;

  DriverDetailsView(
      {required this.selectedDriver, required this.constructorColor});

  @override
  _DriverDetailsViewState createState() => _DriverDetailsViewState();
}

class _DriverDetailsViewState extends State<DriverDetailsView> {
  DriversViewModel viewModel = DriversViewModel();
  Driver? driver;

  @override
  void initState() {
    super.initState();
    fetchDriver();
  }

  void fetchDriver() async {
    driver = await viewModel.fetchDriver(widget.selectedDriver);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (driver != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("${driver!.givenName} ${driver!.familyName}"),
          backgroundColor: widget.constructorColor,
        ),
        // backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                viewModel.driversPic(widget.selectedDriver),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
              // Display driver information
              Text(
                  "Number: ${driver!.permanentNumber} ${viewModel.driverNationalityFlag(driver!.nationality)}",
                  style: TextStyle(fontSize: 24)),
              Text(
                  "Name: ${driver!.givenName} ${driver!.familyName} ${driver!.code}",
                  style: TextStyle(fontSize: 18)),
              Text(
                  "Nationality: ${driver!.nationality} ${viewModel.driverNationalityFlag(driver!.nationality)}",
                  style: TextStyle(fontSize: 18)),
              Text("Date of birth: ${driver!.dateOfBirth}",
                  style: TextStyle(fontSize: 18)),
              // Display driver helmet
              Image.network(
                viewModel.driversHelmetPic(widget.selectedDriver),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}

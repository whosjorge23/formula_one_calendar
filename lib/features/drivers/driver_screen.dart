import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/driver.dart';
import 'package:formula_one_calendar/network/driver_repository.dart';
import 'package:formula_one_calendar/shared_export.dart';

class DriverDetailsScreen extends StatefulWidget {
  final String selectedDriver;
  final Color constructorColor;

  DriverDetailsScreen({required this.selectedDriver, required this.constructorColor});

  @override
  _DriverDetailsScreenState createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  Driver? driver;

  @override
  void initState() {
    super.initState();
    fetchDriver();
  }

  void fetchDriver() async {
    driver = await driverRepository.fetchDriver(widget.selectedDriver);
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
                driver!.getDriverPic,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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
              Text("Number: ${driver!.permanentNumber} ${driver!.getDriverFlag ?? "-"}",
                  style: TextStyle(fontSize: 24)),
              Text("Name: ${driver!.givenName} ${driver!.familyName} ${driver!.code}", style: TextStyle(fontSize: 18)),
              Text("Nationality: ${driver!.nationality} ${driver!.getDriverFlag ?? "-"}",
                  style: TextStyle(fontSize: 18)),
              Text("Date of birth: ${driver!.dateOfBirth}", style: TextStyle(fontSize: 18)),
              // Display driver helmet
              Image.network(
                driver!.getDriverHelmetPic,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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

import 'package:flutter/material.dart';
import 'package:formula_one_calendar/models/constructor.dart';
import 'package:formula_one_calendar/viewmodels/constructor_viewmodel.dart';

import 'constructor_details_view.dart';

class ConstructorsView extends StatefulWidget {
  @override
  State<ConstructorsView> createState() => _ConstructorsViewState();
}

class _ConstructorsViewState extends State<ConstructorsView> {
  ConstructorsViewModel constructorsViewModel = ConstructorsViewModel();
  List<Constructors> constructors = [];

  @override
  void initState() {
    super.initState();
  }

  // fetchConstructors() async {
  //   constructors = (await constructorsViewModel.fetchConstructors())!;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams List'),
      ),
      body: FutureBuilder<List<Constructors>?>(
        future: constructorsViewModel.fetchConstructors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            constructors = snapshot.data!;
            return ListView.builder(
              itemCount: constructors.length,
              itemBuilder: (context, index) {
                final constructor = constructors[index];
                return ListTile(
                  title: Text(
                    constructor.name ?? "-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nationality: ${constructor.nationality} ${constructor.getConstructorFlag}'),
                      Text('Power Unit: ${constructor.getConstructorPowerUnit}'),
                      Text(
                          'Drivers: ${constructor.getConstructorDrivers[0]} - ${constructor.getConstructorDrivers[1]}'),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      constructor.getConstructorImage,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConstructorDetailsView(constructor: constructor),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

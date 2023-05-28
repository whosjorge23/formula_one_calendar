import 'package:flutter/material.dart';

import '../models/constructor_data.dart';
import '../viewmodels/constructor_viewmodel.dart';

class ConstructorsView extends StatefulWidget {
  @override
  _ConstructorsViewState createState() => _ConstructorsViewState();
}

class _ConstructorsViewState extends State<ConstructorsView> {
  final ConstructorsViewModel viewModel = ConstructorsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchConstructors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constructors'),
      ),
      body: ValueListenableBuilder<List<Constructors>>(
        valueListenable: viewModel.constructors,
        builder: (context, constructors, _) {
          return ListView.builder(
            itemCount: constructors.length,
            itemBuilder: (context, index) {
              final constructor = constructors[index];
              return ListTile(
                title: Text(
                  constructor.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nationality: ${constructor.nationality} ${viewModel.constructorNationalityFlag(nationality: constructor.nationality)}'),
                    Text('Power Unit: ${viewModel.constructorPowerUnit(constructorName: constructor.name)}'),
                    Text('Drivers: ${viewModel.constructorDrivers(constructorName: constructor.name)[0]} - ${viewModel.constructorDrivers(constructorName: constructor.name)[1]}'),
                  ],
                ),
                trailing: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(
                    viewModel.constructorImageUrl(constructorName: constructor.name),
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
                },
              );
            },
          );
        },
      ),
    );
  }
}
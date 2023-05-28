import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../viewmodels/constructor_viewmodel.dart';

class ConstructorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConstructorsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Constructors'),
      ),
      body: ListView.builder(
        itemCount: viewModel.constructors.length,
        itemBuilder: (context, index) {
          final constructor = viewModel.constructors[index];
          return ListTile(
            title: Text(
              constructor.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nationality: ${constructor.nationality} ${viewModel.constructorNationalityFlag(constructor.nationality)}'),
                Text('Power Unit: ${viewModel.constructorPowerUnit(constructor.name)}'),
                Text('Drivers: ${viewModel.constructorDrivers(constructor.name)[0]} - ${viewModel.constructorDrivers(constructor.name)[1]}'),
              ],
            ),
            trailing: SizedBox(
              width: 60,
              height: 60,
              child: Image.network(
                viewModel.constructorImageUrl(constructor.name),
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
      ),
    );
  }
}

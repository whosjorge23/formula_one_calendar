import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:formula_one_calendar/features/circuits/cubit/circuit_cubit.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/network/race_repository.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:latlong2/latlong.dart';

class CircuitMapScreen extends StatefulWidget {
  @override
  _CircuitMapScreenState createState() => _CircuitMapScreenState();
}

class _CircuitMapScreenState extends State<CircuitMapScreen> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CircuitCubit, CircuitState>(
      builder: (context, state) {
        return Stack(
          children: [
            state.circuitLocations != null
                ? FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: LatLng(42.6384261, 12.674297),
                      zoom: 5.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: state.circuitLocations!.map((circuit) {
                          return Marker(
                            point: LatLng(double.tryParse(circuit.location?.lat ?? "0.0") ?? 0,
                                double.tryParse(circuit.location?.long ?? "0.0") ?? 0),
                            builder: (context) => GestureDetector(
                              onTap: () {
                                _dialogBuilder(
                                  context,
                                  title: '${circuit.circuitName}',
                                  locality: '${circuit.location?.locality}',
                                  country: '${circuit.location?.country}',
                                  imageUrl: circuit.getCircuitPic,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 120,
                                height: 75,
                                child: Column(
                                  children: [
                                    Text(
                                      "🏁",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    // Text(
                                    //   circuit.circuitName,
                                    //   style: TextStyle(color: Colors.blue, fontSize: 12),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder(BuildContext context,
      {required String title, required String locality, required String country, required String imageUrl}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            height: 190,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("$locality $country"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Image.network(imageUrl, scale: 2),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

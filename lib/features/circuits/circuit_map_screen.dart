import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:formula_one_calendar/features/circuits/cubit/circuit_cubit.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class CircuitMapScreen extends StatefulWidget {
  const CircuitMapScreen({super.key});

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
                        urlTemplate: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
                        subdomains: const ['a', 'b', 'c', 'd'],
                      ),
                      MarkerLayer(
                        markers: state.circuitLocations!.map((circuit) {
                          return Marker(
                            point: LatLng(double.tryParse(circuit.location?.lat ?? "0.0") ?? 0,
                                double.tryParse(circuit.location?.long ?? "0.0") ?? 0),
                            builder: (context) => GestureDetector(
                              onTap: () {
                                _showSimulator(
                                  context,
                                  title: '${circuit.circuitName}',
                                  locality: '${circuit.location?.locality}',
                                  country: '${circuit.location?.country}',
                                  imageUrl: circuit.getCircuitDRSPic,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 120,
                                height: 75,
                                child: const Column(
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

  _showSimulator(BuildContext context,
      {required String title, required String locality, required String country, required String imageUrl}) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Container(
          color: appColors.black,
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  // bottom: 16,
                ),
                color: appColors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$locality $country",
                      style: appTextStyle.getFormulaOne().copyWith(color: appColors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: appColors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          child: Icon(Icons.close)),
                    )
                  ],
                ),
              ),
              Divider(
                color: appColors.white,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$locality $country"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // color: Colors.grey,
                          child: Image.network(imageUrl, scale: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

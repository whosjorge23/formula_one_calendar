import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:formula_one_calendar/models/race_data.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:latlong2/latlong.dart';

class CircuitMapView extends StatefulWidget {
  @override
  _CircuitMapViewState createState() => _CircuitMapViewState();
}

class _CircuitMapViewState extends State<CircuitMapView> {
  final MapController mapController = MapController();
  RaceListViewModel viewModel = RaceListViewModel();
  List<Circuit> circuitLocations = []; // Fetch your data and assign it to this variable
  Circuit? selectedCircuit;

  @override
  void initState() {
    super.initState();
    // Fetch your circuit locations here.
    fetchCircuitLocation();
  }

  fetchCircuitLocation () async {
    circuitLocations = (await viewModel.fetchCircuitLocation())!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
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
              markers: circuitLocations.map((circuit) {
                return Marker(
                  point: LatLng(
                      double.tryParse(circuit.location.lat) ?? 0,
                      double.tryParse(circuit.location.long) ?? 0),
                  builder: (context) => GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   selectedCircuit = circuit;
                      // });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         CircuitDetailsView(circuit: selectedCircuit),
                      //     fullscreenDialog: true,
                      //   ),
                      // );
                      Blurry.info(
                          title:  '${circuit.circuitName}',
                          description:'${circuit.location.locality} ${circuit.location.country}',
                          confirmButtonText:  'Close',
                          displayCancelButton: false,
                          titleTextStyle:  const TextStyle(fontFamily:  'Zen'),
                          popupHeight:  300,
                          buttonTextStyle:  const TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily:  'Zen'
                          ),
                          descriptionTextStyle:  const TextStyle(fontFamily:  'Zen'),
                          onConfirmButtonPressed: () {Navigator.pop(context);})
                          .show(context);
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
        ),
      ],
    );
  }
}
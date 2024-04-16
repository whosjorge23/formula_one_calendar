import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:formula_one_calendar/models/race.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:latlong2/latlong.dart';

class RaceDetailsScreen extends StatefulWidget {
  final Race race;

  RaceDetailsScreen({required this.race});

  @override
  _RaceDetailsScreenState createState() => _RaceDetailsScreenState();
}

class _RaceDetailsScreenState extends State<RaceDetailsScreen> {
  late LatLng _initialCameraPosition;
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = LatLng(
      double.parse(widget.race.circuit?.location?.lat ?? "0.0"),
      double.parse(widget.race.circuit?.location?.long ?? "0.0"),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.race.raceName ?? "-"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${context.l10n.date}: ${widget.race.getDateFormatted ?? "-"}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('${context.l10n.time}: ${widget.race.getTimeGMT ?? "-"}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Text('${context.l10n.circuit}: ${widget.race.circuit?.circuitName}',
                style: Theme.of(context).textTheme.titleLarge),
            Text(
                '${context.l10n.location}: ${widget.race.circuit?.location?.locality}, ${widget.race.circuit?.location?.country} ${widget.race.circuit?.location?.getCountryFlag ?? "-"}',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Container(
              color: Colors.black,
              child: Center(
                child: Image.network(widget.race.circuit!.getCircuitPic, scale: 1.5),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(_initialCameraPosition!.latitude, _initialCameraPosition!.longitude),
                  zoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(_initialCameraPosition!.latitude, _initialCameraPosition!.longitude),
                        builder: (context) => Icon(Icons.location_on),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

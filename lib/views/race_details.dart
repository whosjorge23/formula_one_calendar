import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:formula_one_calendar/viewmodels/race_viewmodel.dart';
import 'package:latlong2/latlong.dart';

import '../models/race.dart';

class RaceDetailsView extends StatefulWidget {
  final Race race;

  RaceDetailsView({required this.race});

  @override
  _RaceDetailsViewState createState() => _RaceDetailsViewState();
}

class _RaceDetailsViewState extends State<RaceDetailsView> {
  late LatLng _initialCameraPosition;
  MapController mapController = MapController();
  RaceListViewModel viewModel = RaceListViewModel();

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
                  'Date: ${viewModel.formatDate(widget.race.date ?? "-")}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Time: ${viewModel.formatTimeInGMT(widget.race.time ?? "-")}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text('Circuit: ${widget.race.circuit?.circuitName}', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                'Location: ${widget.race.circuit?.location?.locality}, ${widget.race.circuit?.location?.country} ${viewModel.countryFlag(widget.race.circuit?.location?.country ?? "-")}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              color: Colors.black12,
              child: Center(
                child: FutureBuilder<String>(
                  future: viewModel.circuitPic(widget.race.circuit?.circuitName ?? "-"),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Image.network(snapshot.data!, scale: 1.5);
                    }
                  },
                ),
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
                    // "https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg",
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

// Rest of the code...

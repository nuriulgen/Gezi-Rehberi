import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/components/widget/appBar_widget.dart';
import 'location_service.dart';

class Distance extends StatefulWidget {
  const Distance({Key? key}) : super(key: key);

  @override
  State<Distance> createState() => _DistanceState();
}

class _DistanceState extends State<Distance> {
  late final Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  Set<Polyline> _polylines = Set<Polyline>();

  Set<Marker> _markers = Set<Marker>();

  int _polylineIdCounter = 1;

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(41.011006, 28.930903),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position: point,
        ),
      );
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 3,
        color: Colors.blue,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Harita'),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8),
                  child: Column(children: [
                    originContainer(),
                    SizedBox(height: 10),
                    destinationContainer(),
                  ]),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF284CF2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      var directions = await LocationService().getDirections(
                        _originController.text,
                        _destinationController.text,
                      );
                      _goToPlace(
                        directions['start_location']['lat'],
                        directions['start_location']['lng'],
                        directions['bounds_ne'],
                        directions['bounds_sw'],
                      );

                      _setPolyline(directions['polyline_decoded']);
                    },
                    icon: Icon(Icons.done, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            googleMaps(context),
          ],
        ));
  }

  Expanded googleMaps(BuildContext context) {
    return Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  polylines: _polylines,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                )),
          );
  }

  Container destinationContainer() {
    return Container(
                    width: 320,
                    child: TextFormField(
                      controller: _destinationController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Varış noktası',
                        contentPadding: EdgeInsets.only(left: 20.0, top: 8),
                        prefixIcon: Icon(Icons.search, size: 25),
                      ),
                    ),
                  );
  }

  Container originContainer() {
    return Container(
                    width: 320,
                    child: TextFormField(
                      controller: _originController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Başlangıç noktası',
                        contentPadding: EdgeInsets.only(left: 20.0, top: 8),
                        prefixIcon: Icon(Icons.search, size: 25),
                      ),
                    ),
                  );
  }

  Future<void> _goToPlace(
    // Map<String, dynamic> place,
    double lat,
    double lng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25),
    );
    _setMarker(LatLng(lat, lng));
  }
}

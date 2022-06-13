import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../core/components/location_detail.dart';
import '../../core/init/network/http_service.dart';
import 'distance.dart';
import 'location_service.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => GoogleMapsViewState();
}

class GoogleMapsViewState extends State<GoogleMapsView> {
  late String searchAddress;
  late final Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  final HttpService httpService = HttpService();
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(41.011006, 28.930903), // haritanın başlama yerini belirler
    zoom: 10,
  );

  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(41.025658, 28.974155),
      infoWindow: InfoWindow(
        title: 'Galata Kulesi',
        snippet: 'Tarihi bir mekan ',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(41.0211216, 29.0019218),
      infoWindow: InfoWindow(title: 'Kız Kulesi', snippet: 'Tarihi bir mekan'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(41.0272723, 29.0670846),
      infoWindow: InfoWindow(
        title: 'Çamlıca Tepesi',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(41.184012, 28.9863134),
      infoWindow: InfoWindow(title: 'Belgrad Ormanı', snippet: 'Orman'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    ),
  ];

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          mapBox(),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 20,
              top: 16,
            ),
            child: Row(
              children: [
                SizedBox(width: 5),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(1),
                  ),
                  child: TextField(
                    controller: _searchController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: 'Burada Arayın',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      suffix: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 25.0,
                        onPressed: () async {
                          var place = await LocationService()
                              .getPlace(_searchController.text);
                          _goToPlace(place);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                directionsButton(context),
                SizedBox(height: 5),
                myLocationButton(),
                SizedBox(width: 10.0),
                locationDetail(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container locationDetail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 10.0),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: boxes(
                  'https://im.haberturk.com/2020/02/25/ver1582697783/2595195_1200x627.jpg',
                  41.025658,
                  28.974155,
                  'Galata Kulesi',
                  '100 tl',
                  'Beyoğlu/İstanbul',
                  '10:00–16:00')),
          SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: boxes(
                'https://istanbeautiful.com/tr/wp-content/uploads/camlica-sosyal-tesisleri2.jpg',
                41.0272723,
                29.0670846,
                'Çamlıca Tepesi',
                'Ücretsiz',
                'Üsküdar/İstanbul',
                '24 Saat Açık'),
          ),
          SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: boxes(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/K%C4%B1z_Kulesi_February_2013_01.jpg/405px-K%C4%B1z_Kulesi_February_2013_01.jpg',
                41.0211216,
                29.0019218,
                'Kız Kulesi',
                '40 tl',
                'Üsküdar/İstanbul',
                '10:00–16:00'),
          ),
          SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: boxes(
                'https://www.bizevdeyokuz.com/wp-content/uploads/belgrad-ormani-istanbul-1155x675.jpg',
                41.184012,
                28.9863134,
                'Belgrad Ormanı',
                'Ücretsiz',
                'Sarıyer/İstanbul',
                '24 Saat Açık'),
          ),
        ],
      ),
    );
  }

  GoogleMap mapBox() {
    return GoogleMap(
      mapType: MapType.normal, // harita type belirler.
      markers: Set<Marker>.of(_marker),
      initialCameraPosition: _cameraPosition,
      myLocationEnabled: true, // şuanki konumumu gösterir.
      myLocationButtonEnabled: false,
      // trafficEnabled: true, // trafik durumunu gösterir.
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  FloatingActionButton myLocationButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: getUserLocation,
      child: Image.asset(
        "assets/images/crosshairs-gps.png",
      ),
    );
  }

  FloatingActionButton directionsButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Distance()));
      },
      child: Icon(Icons.directions, color: Colors.blue, size: 30),
    );
  } // rgb - 26, 155,231

  Future<LatLng?> getUserLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    currentLocation = await location.getLocation();

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 17.0,
      ),
    ));
    return null;
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
  }

  Future<void> gotoLocation(double latitude, double longitude) async {
    print(latitude);
    print(longitude);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 15,
          tilt: 50.0,
          bearing: 45.0,
        ),
      ),
    );
  }

  Widget boxes(String _image, double lat, double long, String name,
      String price, String address, String hour) {
    return GestureDetector(
      onTap: () {
        gotoLocation(lat, long);
      },
      child: MarkerInfoDetails(
        address: address,
        price: price,
        name: name,
        imagePath: _image,
        hour: hour,
      ),
    );
  }
}

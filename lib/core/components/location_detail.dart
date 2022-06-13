import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../google_maps/maps/google_maps_view.dart';

class MarkerInfoDetails extends StatefulWidget {
  final String name;
  final String hour;
  final String address;
  final String imagePath;
  final double? latitude;
  final double? longitude;
  final String price;

  const MarkerInfoDetails({
    Key? key,
    required this.name,
    required this.hour,
    required this.imagePath,
    this.latitude,
    this.longitude,
    required this.price,
    required this.address,
  }) : super(key: key);

  @override
  State<MarkerInfoDetails> createState() => MarkerInfoDetailsState();
}

class MarkerInfoDetailsState extends State<MarkerInfoDetails> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapsViewState view = GoogleMapsViewState();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.imagePath),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer(),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDetailsContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            widget.name,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              'Adres: ${widget.address} ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Fiyat: ${widget.price}",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          'Çalışma Saatleri: ${widget.hour} ',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../components/location_detail.dart';
import '../../../constants/app_constants.dart';
import '../http_service.dart';
import '../model/visit_places.dart';

class VisitPlacesService extends StatefulWidget {
  const VisitPlacesService({Key? key}) : super(key: key);

  @override
  State<VisitPlacesService> createState() => _VisitPlacesServiceState();
}

class _VisitPlacesServiceState extends State<VisitPlacesService> {
  final HttpService httpService = HttpService();
  late final Completer<GoogleMapController> _controller = Completer();
  final AppConstant url = AppConstant();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getVisitPlaces(url.urlVisitPlaces),
      builder:
          (BuildContext context, AsyncSnapshot<List<VisitPlaces>> snapshot) {
        if (snapshot.hasData) {
          var result = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: result.length,
            itemBuilder: (context, int index) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: MarkerInfoDetails(
                  price: result[index].price.toString(),
                  imagePath: result[index].imagePaths[0],
                  name: result[index].name,
                  address: result[index].address,
                  hour: result[index].hours,
                  longitude: result[index].longitude,
                  latitude: result[index].latitude,
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'dart:convert';

List<VisitPlaces> visitPlacesFromMap(String str) =>
    List<VisitPlaces>.from(json.decode(str).map((x) => VisitPlaces.fromMap(x)));

String visitPlacesToMap(List<VisitPlaces> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VisitPlaces {
  VisitPlaces({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.description,
    required this.hours,
    required this.price,
    required this.address,
    required this.publisher,
    required this.category,
    required this.createdAt,
    required this.imagePaths,
  });

  int id;
  double latitude;
  double longitude;
  String name;
  String description;
  String hours;
  int price;
  String address;
  String publisher;
  String category;
  String createdAt;
  List<String> imagePaths;

  factory VisitPlaces.fromMap(Map<String, dynamic> json) => VisitPlaces(
        id: json["id"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        description: json["description"],
        hours: json["hours"],
        price: json["price"],
        address: json["address"],
        publisher: json["publisher"],
        category: json["category"],
        createdAt: json["createdAt"],
        imagePaths: List<String>.from(json["imagePaths"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "description": description,
        "hours": hours,
        "price": price,
        "address": address,
        "publisher": publisher,
        "category": category,
        "createdAt": createdAt,
        "imagePaths": List<dynamic>.from(imagePaths.map((x) => x)),
      };
}

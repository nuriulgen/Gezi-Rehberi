import 'package:flutter/material.dart';

import 'favorites_detail.dart';

class CardFavorites extends StatelessWidget {
  final String resimUrl;
  final Color? color;
  final Widget? child;
  final double? elevation;
  final double? radius;
  final Color? shadowColor;
  final String placeName;
  final listelenenMekanlar;
  final String descriptionCard;
  final String workingHours;
  final String addressCard;
  final String categoryCard;
  final String priceCard;

  CardFavorites(
      {Key? key,
      this.elevation,
      this.shadowColor,
      this.color,
      this.child,
      this.radius,
      required this.resimUrl,
      required this.placeName,
      required this.descriptionCard,
      required this.workingHours,
      this.listelenenMekanlar,
      required this.addressCard,
      required this.categoryCard,
      required this.priceCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 10),
      elevation: elevation ?? 5,
      shadowColor: shadowColor ?? Colors.grey,
      color: color ?? Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoriteDetailPage(
                secilenYer: listelenenMekanlar,
                name: placeName,
                description: descriptionCard,
                imagePaths: resimUrl,
                hours: workingHours,
                address: addressCard,
                category: categoryCard,
                price: priceCard,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(resimUrl),
        ),
        title: Text(
          placeName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                      children: [
                        TextSpan(text: descriptionCard),
                      ]),
                ),
                SizedBox(height: 5),
                Text(
                  workingHours,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                )
              ],
            )),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import '../../view/home/harita_ekrani.dart';
import '../init/lang/locale_keys.dart';
import 'icons.dart';
import 'widget/favorite_listTile.dart';
import 'widget/page_view_image.dart';
import 'widget/show_alert_dialog_widget.dart';

class FavoriteDetailPage extends StatefulWidget {
  final secilenYer;
  final String name;
  final String description;
  final String hours;
  final String address;
  final String category;
  final String price;
  final String imagePaths;

  const FavoriteDetailPage(
      {Key? key,
      required this.secilenYer,
      required this.name,
      required this.description,
      required this.hours,
      required this.address,
      required this.category,
      required this.price,
      required this.imagePaths})
      : super(key: key);

  @override
  State<FavoriteDetailPage> createState() => _FavoriteDetailPageState();
}

class _FavoriteDetailPageState extends State<FavoriteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(top: 20),
                child: SliderImage(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '# ' + widget.category,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleIcon(
                                circleIcon:
                                    CupertinoIcons.arrow_up_right_diamond,
                                text: LocaleKeys
                                    .profil_favorites_detail_subtitle1
                                    .tr(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HaritaSayfasi(),
                                    ),
                                  );
                                }),
                            CircleIcon(
                              circleIcon: CupertinoIcons.bookmark,
                              text: LocaleKeys.profil_favorites_detail_subtitle2
                                  .tr(),
                            ),
                            CircleIcon(
                              circleIcon: CupertinoIcons.captions_bubble,
                              text: LocaleKeys.profil_favorites_detail_subtitle3
                                  .tr(),
                              onPressed: () {
                                showAlertDialog(context);
                              },
                            ),
                            CircleIcon(
                              circleIcon: CupertinoIcons.share,
                              text: LocaleKeys.profil_favorites_detail_subtitle4
                                  .tr(),
                            ),
                          ],
                        ),
                        Divider(height: 25, thickness: 1.0),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(text: widget.description),
                            ],
                          ),
                        ),
                        Divider(height: 25, thickness: 1.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FavoriteListTile(
                          icon: CupertinoIcons.location,
                          title: widget.address,
                        ),
                        FavoriteListTile(
                          icon: CupertinoIcons.clock,
                          title: widget.hours,
                        ),
                        FavoriteListTile(
                          icon: Icons.money,
                          title: 'Fiyat: ${widget.price}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

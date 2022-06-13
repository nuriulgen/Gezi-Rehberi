import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wiredash/wiredash.dart';

import '../../core/components/settings_listTile.dart';
import '../../core/components/widget/icon_language.dart';
import '../../core/components/widget/profile_widget.dart';
import '../../core/init/lang/locale_keys.dart';
import '../test/model/user.dart';
import '../test/model/user_preferences.dart';
import 'edit_profile_page.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String data = '';
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/gizlilk.txt');
    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 15.0, right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 280,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  buildName(user),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 15.0, bottom: 8),
            child: Text(
              LocaleKeys.settings_title.tr(),
              style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 15.0, right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              height: 300,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  SettingsListTile(
                    icon: Icons.language_outlined,
                    title: LocaleKeys.settings_subtitle1.tr(),
                    onPressed: () {
                      languageChangeSettings(context);
                    },
                  ),
                  SettingsListTile(
                    icon: CupertinoIcons.shield_fill,
                    title: LocaleKeys.settings_subtitle2.tr(),
                    onPressed: () {
                      showMyDialog(context);
                    },
                  ),
                  SettingsListTile(
                      icon: CupertinoIcons.question_diamond_fill,
                      title: LocaleKeys.settings_subtitle3.tr(),
                      onPressed: () {
                        Wiredash.of(context)!.show();
                      }),
                  SettingsListTile(
                    icon: CupertinoIcons.person_add_solid,
                    title: LocaleKeys.settings_subtitle4.tr(),
                    onPressed: () {},
                  ),
                  SettingsListTile(
                      icon: Icons.info,
                      title: LocaleKeys.settings_subtitle5.tr(),
                      onPressed: () {
                        showLicensePage(
                          context: context,
                          // applicationIcon: Image.asset(name)
                          applicationName: 'Gezi Rehberi',
                          applicationVersion: '1.0',
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ListView(
            children: [
              AlertDialog(
                title: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    children: [
                      TextSpan(text: data),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Kabul Ediyorum')),
                ],
              ),
            ],
          );
        },
      );
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

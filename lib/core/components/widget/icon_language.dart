import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../init/lang/locale_keys.dart';

void languageChangeSettings(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              children: [
                Text(
                  LocaleKeys.login_language.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.setLocale(AppConstant.EN_LOCALE);
                      },
                      child: Column(
                        children: [
                          Icon(Icons.language),
                          Text("English"),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                        onPressed: () {
                          context.setLocale(AppConstant.TR_LOCALE);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.language),
                            Text("Türkçe"),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(LocaleKeys.login_language_ok.tr(),
                          style: TextStyle(fontSize: 18))),
                )
              ],
            )
          ],
        );
      });
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_widgets/view/authentication/acilis_ekrani.dart';
import 'package:wiredash/wiredash.dart';

import 'core/constants/app_constants.dart';
import 'view/test/model/user_preferences.dart';

Future main() async {
  await dotenv.load(fileName: '.env'); // .env dosyasında verileri okuma
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // ekran yatay döndürme kilitlendi sadece portre modu açık
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await UserPreferences.init();
  runApp(
    EasyLocalization(
      supportedLocales: AppConstant.SUPPORTED_LOCALE,
      path: AppConstant.LANG_PATH,
      fallbackLocale: Locale('tr', 'TR'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'YOUR-PROJECT-ID',
      secret: 'YOUR-SECRET',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        //theme: MyThemes.lightTheme,
        //darkTheme: MyThemes.darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  final String urlVotingVisitPlaces =
      dotenv.env['VotingVisitPlaces'] ?? 'API_KEY not found';
  final String urlComments = dotenv.env['Comments'] ?? 'API_KEY not found';
  final String urlVisitPlaces =
      dotenv.env['VisitPlaces'] ?? 'API_KEY not found';
  final String urlUser = dotenv.env['Users'] ?? 'API_KEY not found';

  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "assets/lang";

  static const SUPPORTED_LOCALE = [
    AppConstant.EN_LOCALE,
    AppConstant.TR_LOCALE,
  ];
}

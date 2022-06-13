import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login/giris_yap_ekrani.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: GirisYapEkrani(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "assets/images/konum.png",
      text: "Gezi Rehberi",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}

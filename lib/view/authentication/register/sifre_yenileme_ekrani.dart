import 'package:flutter/material.dart';

class SifreYenile extends StatefulWidget {
  const SifreYenile({Key? key}) : super(key: key);

  @override
  _SifreYenileState createState() => _SifreYenileState();
}

class _SifreYenileState extends State<SifreYenile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Yenile'),
      ),
      body: Center(
        child: Text('Şifre Yenile'),
      ),
    );
  }
}

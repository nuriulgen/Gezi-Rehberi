import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/form_field.dart';
import '../../../core/components/widget/appBar_widget.dart';
import '../../../core/init/lang/locale_keys.dart';
import '../register/dogrulama_kodu_ekrani.dart';

class SifremiUnutttumEkrani extends StatefulWidget {
  SifremiUnutttumEkrani({Key? key}) : super(key: key);

  @override
  State<SifremiUnutttumEkrani> createState() => _SifremiUnutttumEkraniState();
}

class _SifremiUnutttumEkraniState extends State<SifremiUnutttumEkrani> {
  String _email = '';

  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, ''),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF3949AB),
                      fontSize: 32,
                    ),
                    children: [
                      TextSpan(text: 'Şifreni mi Unuttun ?'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                child: Center(
                  child: Text(
                    ' Hesabınızla ilişkili e-posta\n '
                    '          adresini giriniz',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            Form(
                key: _formkey2,
                child: Column(
                  children: [
                    FormFieldText(
                      bottom: 5.0,
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.sign_up_email.tr(),
                      onSaved: (deger) {
                        _email = deger!; // verilerin kaydedilmesi
                        print(_email);
                      },
                      validator: (deger) {
                        // email doğrulama işlemleri
                        if (deger!.isEmpty) {
                          return 'mail boş olamaz';
                        } else if (!EmailValidator.validate(deger)) {
                          return 'Geçerli bir mail giriniz';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Color(0xFF3949AB),
                  borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3949AB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  bool _validate = _formkey2.currentState!.validate();
                  if (_validate) {
                    _formkey2.currentState!.save();
                    // bilgileri okuyup ekranda göstermesi
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Kod mail adresinize gönderilmiştir',
                      ),
                    ));
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => KoduDogrula()));
                  }
                },
                child: Text(
                  'Doğrulama Kodu Gönder',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

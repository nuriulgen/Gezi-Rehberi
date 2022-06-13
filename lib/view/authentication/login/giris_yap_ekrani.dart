import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/form_field.dart';
import '../../../core/components/widget/icon_language.dart';
import '../../../core/init/lang/locale_keys.dart';
import '../../home/bottom_navigator_ekrani.dart';
import '../forgot/sifremi_unuttum_ekrani.dart';
import '../sign_up/kayit_ol_ekrani.dart';

class GirisYapEkrani extends StatefulWidget {
  GirisYapEkrani({Key? key}) : super(key: key);

  @override
  State<GirisYapEkrani> createState() => _GirisYapEkraniState();
}

class _GirisYapEkraniState extends State<GirisYapEkrani> {
  String _email = '';
  String _sifre = '';
  bool _isHidden = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 345, top: 30),
              child: IconButton(
                icon: Icon(Icons.language, size: 30),
                onPressed: () {
                  languageChangeSettings(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 110),
              child: Center(
                child: Text(
                  'Gezi Rehberi',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF3949AB),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    FormFieldText(
                      left: 30,
                      right: 30,
                      initialValue: 'nuri@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.login_email.tr(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      onSaved: (deger) {
                        _email = deger!;
                        print(_email); // verilerin kaydedilmesi
                      },
                      validator: (deger) {
                        // email doğrulama işlemleri
                        if (deger!.isEmpty) {
                          return 'Email boş olamaz!';
                        } else if (!EmailValidator.validate(deger)) {
                          return 'Geçerli bir mail giriniz';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 5),
                    FormFieldText(
                      left: 30,
                      right: 30,
                      initialValue: 'nuri07',
                      keyboardType: TextInputType.text,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden
                                ?

                                /// Check Show & Hide.
                                Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        hintText: LocaleKeys.login_password.tr(),
                      ),
                      onSaved: (deger) {
                        _sifre = deger!;
                        print(_sifre);
                      },
                      validator: (deger) {
                        // şifre doğrulama işlemleri
                        if (deger!.isEmpty) {
                          return "Şifre boş olamaz";
                        } else if (deger.length < 6) {
                          return 'Şifre en az 6 karakter olmalı';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SifremiUnutttumEkrani()));
                      },
                      child: Text(
                        LocaleKeys.login_forgotText.tr(),
                        style:
                            TextStyle(color: Color(0xFF3949AB), fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xFF3949AB),
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF3949AB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        onPressed: () {
                          bool _validate = _formkey.currentState!.validate();
                          if (_validate) {
                            _formkey.currentState!.save();
                            Navigator.of(context).pushReplacement(
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const BottomNavigatorPage()));
                          }
                        },
                        child: Text(
                          LocaleKeys.login_loginButton.tr(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(height: 180),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => KayitOlEkrani()));
                      },
                      child: Text(
                        LocaleKeys.login_dontAccount.tr(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/form_field.dart';
import '../../../core/components/widget/appBar_widget.dart';
import '../../../core/init/lang/locale_keys.dart';
import '../login/giris_yap_ekrani.dart';

class KayitOlEkrani extends StatefulWidget {
  KayitOlEkrani({Key? key}) : super(key: key);

  @override
  State<KayitOlEkrani> createState() => _KayitOlEkraniState();
}

class _KayitOlEkraniState extends State<KayitOlEkrani> {
  String _ad = '';

  String _soyAd = '';

  String _email = '';

  TextEditingController password = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, LocaleKeys.sign_up_title.tr()),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Container(
                  width: 390.00,
                  height: 630.00,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        FormFieldText(
                          top: 30.0,
                          bottom: 5.0,
                          keyboardType: TextInputType.text,
                          hintText: LocaleKeys.sign_up_name.tr(),
                          onSaved: (deger) {
                            _ad = deger!;
                          },
                          validator: (deger) {
                            if (deger!.length < 3) {
                              return 'Adınız en az 3 karakter olmalı';
                            } else {
                              return null;
                            }
                          },
                        ),
                        FormFieldText(
                          bottom: 5.0,
                          hintText: LocaleKeys.sign_up_surname.tr(),
                          onSaved: (deger) {
                            _soyAd = deger!;
                          },
                          validator: (deger) {
                            if (deger!.length < 2) {
                              return 'Soyadınız en az 2 karakter olmalı';
                            } else {
                              return null;
                            }
                          },
                        ),
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
                        FormFieldText(
                            controller: password,
                            bottom: 5.0,
                            hintText: LocaleKeys.sign_up_password.tr(),
                            validator: (deger) {
                              // şifre doğrulama işlemleri
                              if (deger!.isEmpty) {
                                return "Şifre boş olamaz";
                              } else if (deger.length < 6) {
                                return 'Şifre en az 6 karakter olmalı';
                              } else {
                                return null;
                              }
                            }),
                        FormFieldText(
                          bottom: 30.0,
                          controller: confirmpassword,
                          hintText: LocaleKeys.sign_up_reEnter.tr(),
                          validator: (value) {
                            if (password.text != confirmpassword.text) {
                              return "Şifreler eşleşmiyor!";
                            }
                            return null;
                          },
                        ),
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF3949AB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            onPressed: () {
                              bool _validate =
                                  _formkey.currentState!.validate();
                              if (_validate) {
                                _formkey.currentState!.save();
                                // bilgileri okuyup ekranda göstermesi
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Başarıyla kayıt oldunuz.Giriş yapınız.',
                                  ),
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            GirisYapEkrani()));
                              }
                            },
                            child: Text(
                              LocaleKeys.sign_up_Button.tr(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

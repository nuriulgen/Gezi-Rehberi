import 'package:flutter/material.dart';

import '../../core/components/form_field.dart';
import '../../core/components/widget/appBar_widget.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => TestState();
}

class TestState extends State<Test> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'Katkı'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FormFieldText(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Adı',
                ),
              ),
              FormFieldText(
                maxLinesLenght: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Tanımı',
                ),
              ),
              FormFieldText(
                maxLinesLenght: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Adres',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 500,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<String>(
                    //alignment: AlignmentDirectional.topStart,
                    focusColor: Colors.transparent,
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    icon: Row(
                      children: [
                        SizedBox(width: 200),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                    iconEnabledColor: Colors.black,
                    items: <String>[
                      'Tarihi Yer',
                      'Cami',
                      'Müze',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Kategori Seçin",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _chosenValue = value!;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 240,
                    child: FormFieldText(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Çalışma Saatleri:',
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    child: FormFieldText(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Ücret',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    width: 400,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    child: Center(
                      child: Icon(Icons.camera_alt, size: 30),
                    )),
              ),
            ],
          ),
        ));
  }
}

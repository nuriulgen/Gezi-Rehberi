import 'package:flutter/material.dart';

class YorumYapAlert extends StatelessWidget {
  const YorumYapAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 350,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('logo'),
              radius: 22,
            ),
            title: Text(
              'Nuri Ulgen',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              'Herkese Açık Yayınlanıyor',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Form(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Kişisel deneyiminizi burada paylaşın',
                hintStyle: TextStyle(fontSize: 13),
              ),
              maxLines: 5,
              maxLength: 140,
              onSaved: (deger) {},
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("İptal"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget postButton = TextButton(
    child: Text("Yayınla"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Yorum Yap",
      textAlign: TextAlign.center,
    ),
    content: YorumYapAlert(),
    actions: [
      cancelButton,
      postButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

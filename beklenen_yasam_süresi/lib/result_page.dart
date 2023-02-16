import 'package:flutter/material.dart';
import 'package:gesture_detector/constants.dart';
import 'package:gesture_detector/user_data.dart';
import 'package:gesture_detector/calculation.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sonuç Sayfası'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Calculation(_userData).calculate().round().toString(),
                style: kMetinStily,
              )),
            ),
            Expanded(
                flex: 1,
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Geri Dön'),
                ))
          ],
        ),
      ),
    );
  }
}

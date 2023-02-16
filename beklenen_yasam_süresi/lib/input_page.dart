import 'package:gesture_detector/result_page.dart';
import 'package:gesture_detector/user_data.dart';

import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPage();
}

class _InputPage extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilensigara = 15;
  double haftalikSpor = 0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Yaşam Beklentisi',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('BOY'),
                      renk: CupertinoColors.lightBackgroundGray,
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton('KİLO'),
                      renk: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kaç Gün Spor Yapıyorsunuz?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider.adaptive(
                      divisions: 7,
                      value: haftalikSpor,
                      onChanged: (double value) {
                        setState(() {
                          haftalikSpor = value;
                        });
                      },
                      min: 0,
                      max: 7,
                    ),
                    Text(
                      haftalikSpor.round().toString(),
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                renk: CupertinoColors.white,
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider.adaptive(
                      value: icilensigara,
                      onChanged: (double value) {
                        setState(() {
                          icilensigara = value;
                        });
                      },
                      min: 0,
                      max: 30,
                    ),
                    Text(
                      icilensigara.round().toString(),
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                renk: Colors.white,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'Kadın';
                        });
                      },
                      renk: seciliCinsiyet == 'Kadın'
                          ? Colors.lightGreen
                          : Colors.white,
                      child: MyColumn(
                          icon: FontAwesomeIcons.venus, cinsiyet: 'Kadın'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'Erkek';
                        });
                      },
                      renk: seciliCinsiyet == 'Erkek'
                          ? Colors.lightGreen
                          : Colors.white,
                      child: MyColumn(
                          icon: FontAwesomeIcons.mars, cinsiyet: 'Erkek'),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: MaterialButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          UserData(
                              kilo: kilo,
                              boy: boy,
                              icilensigara: icilensigara,
                              seciliCinsiyet: seciliCinsiyet,
                              haftalikSpor: haftalikSpor),
                        ),
                      ));
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinStily,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowOutlineButton(
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kMetinStily,
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label == 'BOY' ? boy.toString() : kilo.toString(),
              style: kSayiStily,
            )),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(width: 2, color: Colors.green),
                ),
                onPressed: () {
                  setState(() {
                    label == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2, color: Colors.green),
                  ),
                  onPressed: () {
                    setState(() {
                      label == 'KİLO' ? kilo-- : boy--;
                    });
                  },
                  child: Icon(CupertinoIcons.minus)),
            ),
          ],
        ),
      ],
    );
  }
}

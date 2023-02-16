import 'dart:core';

import 'package:gesture_detector/user_data.dart';

class Calculation {
  UserData _userData;

  Calculation(this._userData);

  double calculate() {
    double sonuc;

    sonuc = 90 +
        ((3 * _userData.haftalikSpor) / 3) -
        ((4 * _userData.icilensigara) / 2);
    sonuc = sonuc + (_userData.boy / _userData.kilo);
    if (_userData.seciliCinsiyet == 'KADIN') {
      return sonuc + 7;
    } else {
      return sonuc;
    }
  }
}

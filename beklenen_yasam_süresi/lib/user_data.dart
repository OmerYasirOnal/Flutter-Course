import 'package:flutter/material.dart';

class UserData {
  String seciliCinsiyet = '';
  double icilensigara = 15;
  double haftalikSpor = 0;
  int boy = 170;
  int kilo = 60;

  UserData(
      {required this.seciliCinsiyet,
      required this.icilensigara,
      required this.haftalikSpor,
      required this.boy,
      required this.kilo});
}

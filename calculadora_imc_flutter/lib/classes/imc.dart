
import 'package:flutter/material.dart';

class Imc {

  final String _id = UniqueKey().toString();
  double _imc = 0.0;
  

  Imc (this._imc);

  String get id => _id; 

  double get imc => _imc;

  set imc(double imc) {
    _imc = imc;
  }

  

}


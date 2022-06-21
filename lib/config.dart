library config.globals; //Archivo de configuración global
import 'package:flutter/material.dart';

import 'database/gastos.dart';

ThemeData temaP = ThemeData(
  primarySwatch: Colors.red,textTheme: TextTheme(headline1: TextStyle(fontSize: 12)));
  List<Gastos> losgastos = [
    Gastos (concepto:"Papos el nata", cantidad:1500, fecha:DateTime.now()),
    Gastos (concepto:"Tocino", cantidad:80.52, fecha:DateTime.now()),
    Gastos (concepto:"Tomates", cantidad:73.21, fecha:DateTime.now())
  ];
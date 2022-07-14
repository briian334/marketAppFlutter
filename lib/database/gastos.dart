import 'package:flutter/widgets.dart';

import '../config.dart';

class Gastos with ChangeNotifier {
  String? concepto;
  double? cantidad;
  DateTime? fecha;
  Gastos({this.concepto, this.cantidad, this.fecha});
  void agregarCompra() {
    notifyListeners();
  }

  void remove(int indice) {
    losgastos.removeAt(indice);
    notifyListeners();
  }
}

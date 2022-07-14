//WIDGET INDEPENDIENTE DE FORMADATOS
// ignore_for_file: list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../config.dart';
import '../database/gastos.dart';
import '../database/semana.dart';
import '../run.dart';

// ignore: camel_case_types
DateTime hoy = DateTime.now();
final TextEditingController cantidadController =
    TextEditingController(); //CANTIDAD
final TextEditingController concepController = TextEditingController();

class formaWidget extends StatefulWidget {
  const formaWidget({Key? key}) : super(key: key);

  @override
  State<formaWidget> createState() => formaWidgetState();
}

class formaWidgetState extends State<formaWidget> {
  //CONTROLADORES DE TEXTO
  //CONCEPTO
//MÉTOOD DE AGREGAR UN GASTO

  void _agregarGasto() {
    //double cantidadCompra = double.parse(cantidadController.text);
    Gastos gasto = Gastos(
        concepto:
            concepController.text.isEmpty ? "gasto" : concepController.text,
        cantidad: cantidadController.text.isEmpty
            ? 0.0
            : double.parse(cantidadController.text),
        fecha: currentDate == null ? DateTime.now() : currentDate!);
    setState(() {
      losgastos.add(gasto);
      _rellenar();
      semana = sumaGastosSemana();
    });
    debugPrint(cantidadController.text);

    Navigator.pop(context);
    cantidadController.clear();
    concepController.clear();
  }

//MÉTODO DE RELLENAR
  void _rellenar() {
    losgastos = gastosSemana;
  }

  List<Gastos> get gastosSemana {
    return losgastos
        .where((gasto) => gasto.fecha!.isAfter(currentDate == null
            ? DateTime.now()
            : currentDate!.subtract(const Duration(days: 5))))
        .toList();
  }

  List<Semana> sumaGastosSemana() {
    return List.generate(5, (index) {
      currentDate == null
          ? hoy = DateTime.now().subtract(Duration(days: index))
          : hoy = currentDate!.subtract(Duration(days: index));
      double suma = 0;
      List<Gastos> gasto = gastosSemana;
      //debugPrint(DateTime.now().subtract(Duration(days: index)).toString());
      for (int i = 0; i < gasto.length; i++) {
        if (gasto[i].fecha!.day == hoy.day) {
          suma += gasto[i].cantidad!;
        }
      }
      return Semana(
          dia: DateFormat('EEE').format(hoy).substring(0, 2), monto: suma);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: concepController,
            decoration: const InputDecoration(hintText: "Concepto:"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: cantidadController,
            decoration: const InputDecoration(hintText: "Cantidad"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                currentDate == null ||
                        concepController.text.isEmpty ||
                        cantidadController.text.isEmpty
                    ? showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("AVISO",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 35)),
                              content: const Text(
                                "¡Por favor seleccione una fecha o llene los campos correctamente!",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(fontSize: 20),
                                    ))
                              ],
                            ))
                    : _agregarGasto();
                enviarGasto.agregarCompra();
              },
              child: const Text("Guardar"))
        ],
      ),
    );
  }
}

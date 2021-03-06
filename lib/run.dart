import 'package:flutter/material.dart';
import 'package:gastos/config.dart';

import 'package:gastos/widgets/barritas.dart';
import 'package:gastos/widgets/forma.dart';

import 'widgets/bitacora.dart';

DateTime? currentDate;

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);
  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  //Clase forma datos
  void formaDatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => formaWidget());
  }

  // //DATEPICKER
  // DateTime? _currentDate = DateTime.now();
  // void callDatePicker() async {
  //   var selectDay = await getDayPicker();
  //   setState(() {
  //     _currentDate = selectDay;
  //   });
  // }

  // Future<DateTime?> getDayPicker() {
  //   return showDatePicker(
  //       context: context,
  //       initialDate: _currentDate!,
  //       firstDate: DateTime.utc(2022, 7, 11),
  //       lastDate: DateTime.utc(2022, 7, 15));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
              onPressed: () => formaDatos(), icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate:
                      currentDate == null ? DateTime.now() : currentDate!,
                  firstDate: DateTime.now().subtract(const Duration(days: 6)),
                  lastDate: DateTime.now(),
                  //useRootNavigator: true,
                ).then((date) {
                  date == null
                      ? showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text("AVISO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 35)),
                                content: const Text(
                                  "??Por favor seleccione una fecha correcta!",
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
                      : setState(() {
                          currentDate = date;
                        });
                });
              },
              icon: const Icon(Icons.alarm_sharp)),
          IconButton(
              onPressed: () => themach.cambiarTema(),
              icon: const Icon(Icons.dark_mode))
        ],
        title: const Text("Gastos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Barritas(),
            ),
            SizedBox(height: 500, width: double.infinity, child: Bitacora()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: formaDatos, child: const Icon(Icons.add)),
    );
  } //end class
}

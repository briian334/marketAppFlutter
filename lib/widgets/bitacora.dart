import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';

class Bitacora extends StatefulWidget {
  Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eliminarGasto.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return losgastos.isEmpty
        ? cargarImagen()
        : ListView.builder(
            itemCount: losgastos.length,
            itemBuilder: (context, indice) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  debugPrint("UPDATE");
                                },
                                icon: const Icon(
                                  Icons.drive_file_rename_outline_outlined,
                                  color: Colors.amber,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            title: const Text("¡Precaución!",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 35)),
                                            content: Text(
                                              "¿Deseas borrar el gasto '${losgastos[indice].concepto}'?",
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            actions: [
                                              TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Color
                                                                  .fromARGB(
                                                                      255,
                                                                      11,
                                                                      202,
                                                                      2))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Regresar",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  )),
                                              TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Color
                                                                  .fromARGB(
                                                                      255,
                                                                      177,
                                                                      9,
                                                                      9))),
                                                  onPressed: () {
                                                    losgastos[indice]
                                                        .remove(indice);
                                                    eliminarGasto
                                                        .agregarCompra();
                                                    //debugPrint(gastosSemana.toString());
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Eliminar",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        title: Text(losgastos[indice].concepto!),
                        subtitle: Text(DateFormat('dd-MM-yy')
                            .format(losgastos[indice].fecha!)),
                        leading:
                            Text("\$ ${losgastos[indice].cantidad.toString()}"))
                  ],
                )));
  } //end build

  Widget cargarImagen() => Card(
        elevation: 5,
        child: Image.asset("assets/images/waiting.png"),
      );
}

import 'package:flutter/material.dart';
import 'package:market_app/config.dart';
import 'package:market_app/widgets/barra_circular.dart';
import 'package:market_app/widgets/widget_bitacora.dart';
import 'package:market_app/widgets/widget_mediaquery.dart';
import 'package:market_app/widgets/widget_barras.dart';

import 'database/gastos.dart';

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);

  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.add)),
          IconButton(onPressed: null, icon: Icon(Icons.dark_mode))
        ],
        title: const Text("Gastos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: widget_barras(),
            ),
            SizedBox(
              child: widget_bitacora(),
              height: 200,
              width: double.infinity,
            ) 
            /*SizedBox(
              child: barra_circular(),
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => formadatos(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void formadatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (__) => widget_mediaquery());
  }
}

import 'package:flutter/material.dart';
import 'package:market_app/config.dart';
import 'package:market_app/widgets/widget_bitacora.dart';
import 'package:market_app/widgets/widget_mediaquery.dart';
import 'package:market_app/widgets/widget_barras.dart';

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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: widget_barras(),
          ),
          SingleChildScrollView(
            child: widget_bitacora(),
          )
        ],
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

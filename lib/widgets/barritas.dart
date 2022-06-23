import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class barritas extends StatefulWidget {
  barritas({Key? key}) : super(key: key);

  @override
  State<barritas> createState() => _barritasState();
}

class _barritasState extends State<barritas> {
    ChartSeriesController? _chartSeriesController;
    final List<Semana> _semana = [
                           Semana(dia:"Lunes",cantidad:80),
                           Semana(dia:"Martes",cantidad:75),
                           Semana(dia:"Miercoles",cantidad:28),
                           Semana(dia:"Jueves",cantidad:30),
                           Semana(dia:"Viernes",cantidad:150)];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(15.0),
      child: SfCartesianChart(
        isTransposed: true,
        title: ChartTitle(text: "Cálculo de gastos semanal"),
        legend: Legend(
          isVisible: true),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          decimalPlaces: 5),
          series: <ChartSeries<Semana,String>>[
            BarSeries<Semana,String>(
              name: "Los gastitos",
              dataLabelSettings: DataLabelSettings(
                isVisible: true),
            onRendererCreated: ((controller) => _chartSeriesController),
            dataSource: _semana, 
            xValueMapper: (Semana,_)=>Semana.dia, 
            yValueMapper: (Semana,_)=>Semana.cantidad
            )
          ],
        primaryXAxis: CategoryAxis(),
      ));
  }
}
class Semana{
  Semana({this.dia, this.cantidad}); //cconstructor de la clase Semana
  final String? dia;
  final double? cantidad;
}
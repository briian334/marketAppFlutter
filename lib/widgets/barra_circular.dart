import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class barra_circular extends StatefulWidget {
  barra_circular({Key? key}) : super(key: key);

  @override
  State<barra_circular> createState() => _barra_circularState();
}

class _barra_circularState extends State<barra_circular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfRadialGauge(
        axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(255, 255, 0, 0),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      )
                    ]),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SfRadialGaugeWidget extends ConsumerWidget {
  const SfRadialGaugeWidget(
      {Key? key,
      required this.label,
      required this.total,
      required this.addValue})
      : super(key: key);
  final String label;
  final String total;
  final double addValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            minimum: 0.0,
            maximum: double.parse(total),
            showLabels: true, //メモリ数
            showTicks: false, //メモリ
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.8, //サイズ
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 100,
                  widget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        label,
                        style: const TextStyle(
                            fontFamily: 'Times',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "/ ${total.toString()}",
                        style: const TextStyle(
                            fontFamily: 'Times',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                  value: addValue, //ゲージカウント
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1200,
                  sizeUnit: GaugeSizeUnit.factor,
                  gradient: const SweepGradient(colors: <Color>[
                    Color.fromARGB(150, 23, 54, 234),
                    Color.fromARGB(150, 255, 17, 0)
                  ], stops: <double>[
                    0.25,
                    0.75
                  ]),
                  color: const Color(0xFF00A8B5),
                  width: 0.15),
            ]),
      ],
    );
  }
}

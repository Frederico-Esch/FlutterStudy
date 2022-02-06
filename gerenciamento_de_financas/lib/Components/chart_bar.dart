import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double value;
  final double total;
  const ChartBar({Key? key, required this.value, required this.total}) : super(key: key);

  static const _borderShape = BorderRadius.all(Radius.circular(10));
  @override
  Widget build(BuildContext context) {
    double percentage = value/total;
    if(percentage.isNaN || percentage < 0) percentage = 0;
    return SizedBox(
      width: 15,
      height: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          FractionallySizedBox(
            heightFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: _borderShape
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
                borderRadius: _borderShape,
                border: Border.all(color: Colors.black, width: 3)
            ),
          ),
        ]
      ),
    );
  }
}

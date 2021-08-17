import 'package:flutter/material.dart';

class SensorTileWidget extends StatelessWidget {
  final String sensorTitle;
  final double sensorValue;

  const SensorTileWidget({
    Key? key,
    required this.sensorTitle,
    required this.sensorValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            sensorTitle,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "$sensorValue",
            maxLines: 1,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}

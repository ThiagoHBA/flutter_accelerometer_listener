import 'package:flutter/material.dart';
import 'package:flutter_accelerometer/components/sensor_tile_component.dart';
import 'package:get/get.dart';

import 'package:flutter_accelerometer/view/home/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePageView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => SensorTileWidget(
                sensorTitle: "AccX: ",
                sensorValue: controller.accX.value,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => SensorTileWidget(
                sensorTitle: "AccY: ",
                sensorValue: controller.accY.value,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => SensorTileWidget(
                sensorTitle: "AccZ: ",
                sensorValue: controller.accZ.value,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            controller.startAccelerometerListener();
            controller.startTimer();
          },
          child: Icon(
            Icons.run_circle_outlined,
            color: !controller.isTimerOn ? Colors.green : Colors.red,
            size: 45,
          ),
        ),
      ),
    );
  }
}

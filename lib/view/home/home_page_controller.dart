import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_accelerometer/models/sensor_data_model.dart';
import 'package:flutter_accelerometer/service/file_storage_service.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePageController extends GetxController {
  int _indexCounter = 0;
  List<SensorData> _sensorData = [];
  var _mainCollection;

  var _accX = 0.0.obs;
  var _accY = 0.0.obs;
  var _accZ = 0.0.obs;
  var _microssecondsCronometer = 0.0.obs;
  var _isTimerOn = false.obs;

  var _accelerometterEvents;

  get accX => _accX;
  get accY => _accY;
  get accZ => _accZ;
  get isTimerOn => _isTimerOn.value;

  @override
  void onInit() async {
    super.onInit();
    await Firebase.initializeApp();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _mainCollection = _firestore.collection('Accelerations');
  }

  startTimer() {
    _isTimerOn.value = true;

    Timer.periodic(
      Duration(microseconds: 1),
      (timer) => _handleTimer(timer),
    );
  }

  startAccelerometerListener() {
    _accelerometterEvents = userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        _accX.value = event.x;
        _accY.value = event.y;
        _accZ.value = event.z;

        _sensorData.add(
          SensorData(
            index: _indexCounter,
            accX: _accX.value,
            accY: _accY.value,
            accZ: _accZ.value,
            timeSec: _microssecondsCronometer.value,
          ),
        );

        _indexCounter++;
      },
    );
  }

  _handleTimer(Timer timer) async {
    if (timer.tick <= 300000)
      _microssecondsCronometer.value++;
    else {
      _accelerometterEvents.cancel();
      _isTimerOn.value = false;
      List _data = [];
      for (SensorData data in _sensorData) {
        _data.add(data.toJson());
      }
      try {
        _mainCollection.doc().set({'data': _data.toString()});
        // await FileStorage.writeFile(
        //   file: await FileStorage.createLocalFile(
        //     localPath: await FileStorage.getlocalPath(),
        //     fileName: 'accelerations.json',
        //   ),
        //   value: '${_sensorData[0].toJson()}',
        // );
      } catch (e) {
        print(e.toString());
      }

      timer.cancel();
    }
  }
}

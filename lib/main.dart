import 'package:flutter/material.dart';
import 'package:flutter_accelerometer/view/home/home_page_binding.dart';
import 'package:get/get.dart';

import 'view/home/home_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
      initialBinding: HomePageBinding(),
    );
  }
}

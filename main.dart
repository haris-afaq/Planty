import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty/res/assets_res.dart';
import 'package:planty/screens/splash_page.dart';
import 'package:tflite_v2/tflite_v2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Tflite.loadModel(
      model: AssetsRes.MODEL,
      labels: AssetsRes.LABELS,
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Haris Afaq',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


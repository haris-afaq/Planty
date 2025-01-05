import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:planty/res/assets_res.dart';
import 'my_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const MyHomePage());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3c9),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsRes.SPLASH),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

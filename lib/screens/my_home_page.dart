import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty/res/assets_res.dart';

import '../cors/model_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final model = Get.put(ModelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff3c9),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              width: Get.width,
              child: Image.asset(AssetsRes.SPLASH),
            ),
             SizedBox(height: Get.height*0.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: model.pickerCamera,
                  child: Container(
                    height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_outlined,size: 40,color: Colors.pink,)
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: model.pickerImage,
                  child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.image_rounded,size: 40,color: Colors.pink,)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

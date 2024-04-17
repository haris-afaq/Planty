import 'dart:io';
import '../res/assets_res.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planty/cors/model_controller.dart';

class ScaningImagePage extends StatefulWidget {
  const ScaningImagePage({super.key});

  @override
  State<ScaningImagePage> createState() => _ScaningImagePageState();
}

class _ScaningImagePageState extends State<ScaningImagePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool nameEnd = false;
  bool accuracyEnd = false;
  final controller = Get.put(ModelController());
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    Future.delayed(const Duration(seconds: 3),() {
      _controller.dispose();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value =  controller.data["confidence"]??0.0;
    return Scaffold(
      body: ListView(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: 200,
                margin: const EdgeInsets.all(10),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xfffff3c9), width: 2.0),
                  borderRadius: BorderRadius.circular(19),
                  image: controller.file != null?DecorationImage(image: FileImage(File(controller.file!.path))):null
                ),
                child: Align(
                  alignment: Alignment(0.0, -1.0 + (2.0 * _controller.value)),
                  child: Container(
                    width: Get.width,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xfffff3c9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                     controller.data["label"].toString(),
                      textStyle: const TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  onFinished: (){
                    setState(() {
                      nameEnd = true;
                    });
                  },
                  totalRepeatCount: 1,
                ),
                Visibility(
                  visible: nameEnd,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Confidence : ${(value * 100).toStringAsFixed(0)} %",
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    onFinished: (){
                      setState(() {
                        accuracyEnd = true;
                      });
                    },
                    totalRepeatCount: 1,
                  ),
                ),
                Visibility(
                  visible: nameEnd,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "${plants[controller.data["label"]]}",
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    onFinished: (){

                    },
                    totalRepeatCount: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

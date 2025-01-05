import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planty/screens/scaning_image_page.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ModelController extends GetxController {
  final picker = ImagePicker();
  XFile? file;
  Map data = {};
  void prediction(filepath) async {
    var recognitions = await Tflite.runModelOnImage(
        path: filepath,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true
    );
    print(data);
    data = recognitions![0]??{};
    Get.to(() => const ScaningImagePage());
  }
  void pickerImage() async {
    var pick = await picker.pickImage(source: ImageSource.gallery);
    if (pick != null) {
      file = pick;
      prediction(pick.path);
      update();
    }
  }
  void pickerCamera() async {
    var pick = await picker.pickImage(source: ImageSource.camera);
    if (pick != null) {
      file = pick;
      prediction(pick.path);
      update();
    }
  }
}

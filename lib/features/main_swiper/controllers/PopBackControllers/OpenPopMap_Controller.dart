import 'package:get/get.dart';
import 'PopBackController.dart';

class OpenPopMapController extends GetxController {
  var popBackCtrl = Get.put(PopBackController());
  var isMapFirstScreen = true.obs;

  void toggleisFirst() {
    isMapFirstScreen.value = true;
    popBackCtrl.open();
  }

  void isfirstFalse() {
    isMapFirstScreen.value = false;
    popBackCtrl.close();
  }

  @override
  void onClose() {
    toggleisFirst();
    super.onClose();
  }
}

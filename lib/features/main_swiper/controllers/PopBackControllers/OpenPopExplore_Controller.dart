import 'package:get/get.dart';
import 'PopBackController.dart';

class OpenPopExploreController extends GetxController {
  var popBackCtrl = Get.put(PopBackController());
  var isExploreFirstScreen = true.obs;

  void toggleisFirst() {
    isExploreFirstScreen.value = true;
    popBackCtrl.open();
  }

  void isfirstFalse() {
    isExploreFirstScreen.value = false;
    popBackCtrl.close();
  }

  @override
  void onClose() {
    toggleisFirst();
    super.onClose();
  }
}

import 'package:get/get.dart';
import 'PopBackController.dart';

class OpenPopSettingController extends GetxController {
  var popBackCtrl = Get.put(PopBackController());
  var isProfileFirstScreen = true.obs;

  void toggleisFirst() {
    isProfileFirstScreen.value = true;
    popBackCtrl.open();
  }

  void isfirstFalse() {
    isProfileFirstScreen.value = false;
    popBackCtrl.close();
  }

  @override
  void onClose() {
    toggleisFirst();
    super.onClose();
  }
}

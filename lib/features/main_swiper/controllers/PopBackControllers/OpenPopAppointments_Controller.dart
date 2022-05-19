import 'package:get/get.dart';
import 'PopBackController.dart';

class OpenPopAppointmentsController extends GetxController {
  var popBackCtrl = Get.put(PopBackController());
  var isAppointmentsFirstScreen = true.obs;

  void toggleisFirst() {
    isAppointmentsFirstScreen.value = true;
    popBackCtrl.open();
  }

  void isfirstFalse() {
    isAppointmentsFirstScreen.value = false;
    popBackCtrl.close();
  }

  @override
  void onClose() {
    toggleisFirst();
    super.onClose();
  }
}

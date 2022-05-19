import 'package:get/get.dart';

class PopBackController extends GetxController {
  var canPop = true.obs;
  upd() {
    update();
  }

  void close() {
    canPop.value = false;
  }

  void open() {
    canPop.value = true;
  }
}

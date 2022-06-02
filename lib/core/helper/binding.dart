import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProxyController(), fenix: true);
  }
}

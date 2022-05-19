import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopAppointments_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopExplore_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopMap_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/open_pop_setting_controller.dart';

class MainSwiperController extends GetxController {
  PersistentTabController? bottomBarController;
  var initialPage = 0;
  var selectedItems = [];

  //controllers
  var openPopExploreCtrl = Get.put(OpenPopExploreController());
  var openPopMapCtrl = Get.put(OpenPopMapController());
  var openPopAppointmentsCtrl = Get.put(OpenPopAppointmentsController());
  var openPopProfileCtrl = Get.put(OpenPopSettingController());

  @override
  void onInit() {
    super.onInit();
    bottomBarController = PersistentTabController(initialIndex: initialPage);
    selectedItems.add(0);
    openPopAppointmentsCtrl.isAppointmentsFirstScreen.value = true;
    openPopProfileCtrl.isProfileFirstScreen.value = true;
    // openPopExploreCtrl.isExploreFirstScreen.value = true;
    openPopMapCtrl.isMapFirstScreen.value = true;
  }

  void selectBarItem(int index) {
    if (selectedItems.isNotEmpty && (selectedItems.last != index)) {
      selectedItems.add(index);
      bottomBarController!.index = selectedItems.last;
    } else if (selectedItems.isEmpty) {
      selectedItems.add(index);
      bottomBarController!.index = selectedItems.last;
    }

    update();
  }

  void pressBack() {
    if (selectedItems.length > 1) {
      selectedItems.removeLast();

      bottomBarController!.index = selectedItems.last;
    }

    update();
  }

  upd() {
    update();
  }
}

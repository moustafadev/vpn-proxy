import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/features/home/ui/screens/home_screen.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopAppointments_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopExplore_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/OpenPopMap_Controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/PopBackController.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/main_swiper_controller.dart';
import 'package:proxy_line/features/main_swiper/controllers/PopBackControllers/open_pop_setting_controller.dart';
import 'package:proxy_line/features/orders/ui/screens/order_screen.dart';
import 'package:proxy_line/features/proxy/ui/screens/proxy_screen.dart';
import 'package:proxy_line/features/settings/ui/screens/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainSwiper extends StatefulWidget {
  final int page;
  const MainSwiper({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  _MainSwiperState createState() => _MainSwiperState();
}

class _MainSwiperState extends State<MainSwiper> {
  FocusNode? keyboardFocusNode;
  bool getLocale = false;
  @override
  void initState() {
    keyboardFocusNode = FocusNode();

    // getLocal();
    super.initState();
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      prisistenceBottomBartItem("assets/icons/tabs/home.svg", "Explore"),
      prisistenceBottomBartItem("assets/icons/tabs/proxy.svg", "Map"),
      prisistenceBottomBartItem("assets/icons/tabs/order.svg", "Appointments"),
      prisistenceBottomBartItem("assets/icons/tabs/settings.svg", "Profile"),
    ];
  }

  PersistentBottomNavBarItem prisistenceBottomBartItem(
      String icon, String title) {
    return PersistentBottomNavBarItem(
      inactiveIcon: buildIcon(kWhite, icon, title, Colors.transparent),
      iconSize: 30,
      icon: buildIcon(kYellow, icon, title, kYellow),
      textStyle: const TextStyle(),
      activeColorPrimary: kYellow,
      inactiveColorPrimary: kGreyLight.withOpacity(0.64),
    );
  }

  AnimatedContainer buildIcon(
      Color color, String icon, String tittle, Color textColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 80.0,
      width: 80.0,
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SvgPicture.asset(
            icon,
            color: color,
            height: 24,
            width: 24,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: 3,
            width: 20,
            decoration: BoxDecoration(
                color: textColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var openPopExploreCtrl = Get.put(OpenPopExploreController());
    var openPopMapCtrl = Get.put(OpenPopMapController());
    var openPopAppointmentsCtrl = Get.put(OpenPopAppointmentsController());
    var openPopProfileCtrl = Get.put(OpenPopSettingController());
    var mainSwiperCtrl = Get.put(MainSwiperController());
    return Scaffold(
      body: Stack(
        children: const [
          Image(
            image: AssetImage('assets/images/bg/bg.png'),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopBackController>(
        init: PopBackController(),
        builder: (popBackCtrl) => WillPopScope(
          onWillPop: () {
            setState(() {
              keyboardFocusNode!.unfocus();
            });
            if (mainSwiperCtrl.selectedItems.last == 0 &&
                popBackCtrl.canPop.value == false) {
              FocusScope.of(context).unfocus();
            } else {}

            // if (profileCtrl.fromBooking == true) {
            //   Get.back();
            // }
            if (popBackCtrl.canPop.value == false) {
              return Future.value(true);
            } else if (mainSwiperCtrl.selectedItems.length == 1 &&
                popBackCtrl.canPop.value == true) {
              SystemNavigator.pop();
              return Future.value(true);
            } else {
              mainSwiperCtrl.pressBack();
              return Future.value(false);
            }
          },
          child: PersistentTabView(
            context,
            controller: mainSwiperCtrl.bottomBarController,
            bottomScreenMargin: 0,
            backgroundColor: Colors.white.withOpacity(0.06),
            navBarHeight: 50,
            screens: _buildScreens(),
            stateManagement: true,
            items: navBarItems(),
            margin: const EdgeInsets.only(bottom: 30, right: 14, left: 14),
            padding: const NavBarPadding.all(0),
            navBarStyle: NavBarStyle.simple,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            confineInSafeArea: false,
            hideNavigationBarWhenKeyboardShows: true,
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            selectedTabScreenContext: (context) {
              if (mainSwiperCtrl.selectedItems.last == 3) {
                if (openPopProfileCtrl.isProfileFirstScreen.value == true) {
                  popBackCtrl.open();
                } else {
                  popBackCtrl.close();
                }
              } else if (mainSwiperCtrl.selectedItems.last == 2) {
                // BlocProvider.of<AppointmentslistBloc>(context).add(
                //   GetAppointments(status: 1),
                // );
                if (openPopAppointmentsCtrl.isAppointmentsFirstScreen.value ==
                    true) {
                  popBackCtrl.open();
                } else {
                  popBackCtrl.close();
                }
              } else if (mainSwiperCtrl.selectedItems.last == 1) {
                if (openPopMapCtrl.isMapFirstScreen.value == true) {
                  popBackCtrl.open();
                } else {
                  popBackCtrl.close();
                }
              } else if (mainSwiperCtrl.selectedItems.last == 0) {
                if (openPopExploreCtrl.isExploreFirstScreen.value == true) {
                } else {
                  popBackCtrl.close();
                }
              }
            },
            onItemSelected: (index) async {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => MainScreen(swiperPage: index),
              //   ),
              // );
              popBackCtrl.open();
              mainSwiperCtrl.selectBarItem(index);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeScreen(),
      ProxyScreen(),
      OrderScreen(),
      SettingScreen(),
    ];
  }
}

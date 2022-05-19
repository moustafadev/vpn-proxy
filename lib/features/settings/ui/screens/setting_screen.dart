import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/account/screen/account_screen.dart';
import 'package:proxy_line/features/proxy_check/screen/proxy_check.dart';
import 'package:proxy_line/features/settings/ui/screens/question_screen.dart';
import 'package:proxy_line/features/settings/ui/screens/write_us_screen.dart';
import 'package:proxy_line/features/speed_test/screen/speed_test_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kGreyPrimary,
        centerTitle: true,
        toolbarHeight: 100,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 28, left: 28, bottom: 14),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: const AccountScreen(), withNavBar: false);
                    },
                    child: Text(
                      "Аккаунт",
                      style: mainSemibooextStyle.copyWith(
                          color: kYellow, fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Настройки",
                      style: mainBoldTextStyle.copyWith(
                          color: kWhite, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 70),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [buildTopButtons(), buildListOfMenu()]),
          ),
        ),
      ),
    );
  }

  Widget buildTopButtons() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => pushNewScreen(context,
                screen: const SpeedTestScreen(), withNavBar: false),
            child: Container(
              width: size.width * 0.43,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Проверка \nскорости",
                        style: mainSemibooextStyle.copyWith(
                          fontSize: 13,
                          color: kYellow,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/icons/speed_icon.svg",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              pushNewScreen(context,
                  screen: const ProxyCheck(), withNavBar: false);
            },
            child: Container(
              width: size.width * 0.43,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Проверка \nпрокси",
                        style: mainSemibooextStyle.copyWith(
                          fontSize: 13,
                          color: kYellow,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/icons/check_icon.svg",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListOfMenu() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            pushNewScreen(context,
                screen: const QuestionScreen(), withNavBar: false);
          },
          child: buildMenuItem(
              text: "Вопрос ответ",
              iconName: 'assets/icons/icons/arrow_ios.svg'),
        ),
        const SizedBox(
          height: 1,
        ),
        InkWell(
          onTap: () {
            pushNewScreen(context,
                screen: const WriteUsScreen(), withNavBar: false);
          },
          child: buildMenuItem(
              text: "Написать нам",
              iconName: 'assets/icons/icons/arrow_ios.svg'),
        ),
        const SizedBox(
          height: 1,
        ),
        buildMenuItem(
            text: "Больше возможностей",
            iconName: 'assets/icons/icons/follow_icon.svg'),
        const SizedBox(
          height: 10,
        ),
        buildVersionWidget()
      ],
    );
  }

  Widget buildMenuItem({required String text, required String iconName}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style:
                    mainRegulartStyle.copyWith(fontSize: 15, color: kMainGrey),
              ),
              SvgPicture.asset(
                iconName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVersionWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Версия Proxy Line",
                style:
                    mainRegulartStyle.copyWith(fontSize: 15, color: kMainGrey),
              ),
              Text(
                "1.0.0",
                style: mainBoldTextStyle.copyWith(fontSize: 14, color: kWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

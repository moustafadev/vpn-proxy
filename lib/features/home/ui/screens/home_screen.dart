import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/home/ui/bloc/home_bloc.dart';
import 'package:proxy_line/features/home/ui/screens/buy_proxy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController dataController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isOnButton = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(
          const HomeEvent.started(),
        ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          log("state.isHaveProxy ${state.isHaveProxy}");
          log("state.isOnButton ${state.isOnButton}");

          return Scaffold(
            backgroundColor: kGreyPrimary,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Image(
                      image: AssetImage('assets/images/bg/bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/logo/logo.svg',
                            ),
                          ),
                        ),
                        buildTopInfo(),
                        InkWell(
                          onTap: () async {},
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              state.isHaveProxy
                                  ? state.isOnButton
                                      ? InkWell(
                                          onTap: () async {
                                            await Future.delayed(
                                              const Duration(milliseconds: 300),
                                            );
                                            context.read<HomeBloc>().add(
                                                  const HomeEvent
                                                          .changeStateButtons(
                                                      status: false),
                                                );
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: Image(
                                              width: screenSize.width * 0.5,
                                              height: screenSize.width * 0.5,
                                              image: const AssetImage(
                                                  'assets/images/buttons/off_button.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () async {
                                            await Future.delayed(
                                              const Duration(milliseconds: 300),
                                            );
                                            context.read<HomeBloc>().add(
                                                  const HomeEvent
                                                          .changeStateButtons(
                                                      status: true),
                                                );
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: Image(
                                              width: screenSize.width * 0.5,
                                              height: screenSize.width * 0.5,
                                              image: const AssetImage(
                                                  'assets/images/buttons/on_button.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                  : InkWell(
                                      onTap: () async {
                                        await Future.delayed(
                                          const Duration(milliseconds: 300),
                                        );
                                        context.read<HomeBloc>().add(
                                              const HomeEvent.buyProxy(),
                                            );
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Image(
                                          width: screenSize.width * 0.5,
                                          height: screenSize.width * 0.5,
                                          image: const AssetImage(
                                              'assets/images/buttons/no_proxy.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 120),
                          child: Column(
                            children: [
                              speedWidget(
                                  isCnnectButton: state.isOnButton,
                                  isHaveProxy: state.isHaveProxy),
                              const SizedBox(height: 1),
                              countryWidget(
                                  isHaveProxy: state.isHaveProxy,
                                  contextMain: context),
                              dayAndHourWidget(isProxyHave: state.isHaveProxy),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTopInfo() {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        Text(
          "Ваш IP",
          style: mainRegulartStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "136.117.121.183",
          style: mainBoldTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "United States of America",
              style: mainRegulartStyle.copyWith(fontSize: 15),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "assets/icons/country/flag.svg",
              width: 24,
              height: 16,
            ),
          ],
        ),
      ],
    );
  }

  Widget speedWidget({
    required bool isHaveProxy,
    required bool isCnnectButton,
  }) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: isHaveProxy
                                  ? isCnnectButton
                                      ? kGreen
                                      : kRed
                                  : kYellow,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: isHaveProxy
                                        ? isCnnectButton
                                            ? kGreen
                                            : kRed
                                        : kYellow,
                                    blurRadius: 20.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(0, 0))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              !isHaveProxy || !isCnnectButton
                                  ? "Нет подключения"
                                  : "Подключено",
                              style: mainSemibooextStyle.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        isHaveProxy
                            ? isCnnectButton
                                ? "Скорость подключения"
                                : "Нажмите на кнопку чтобы подключить"
                            : "Приобретите прокси для подключения",
                        style: mainRegulartStyle.copyWith(
                            fontSize: 12, color: kMainGrey),
                      ),
                    ],
                  ),
                ),
              ),
              isCnnectButton
                  ? AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              "12.18",
                              style: mainBoldTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "Mbit/s",
                                style: mainSemibooextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }

  Widget countryWidget(
      {required bool isHaveProxy, required BuildContext contextMain}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: isHaveProxy
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/country/flag.svg",
                            width: 32,
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "United States of America",
                                    style: mainSemibooextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: kYellow,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8,
                                                left: 8,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              "IPv4",
                                              style: mainBoldTextStyle.copyWith(
                                                  color: kBlackLight,
                                                  fontSize: 11),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "136.117.121.183",
                                          style: mainRegulartStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: kGrey636363,
                        size: 18,
                      )
                    ],
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () async {
                    pushNewScreen(
                      context,
                      screen: const BuyProxyScreen(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
      
                   
                  },
                  child: Text(
                    "Купить прокси",
                    style: mainSemibooextStyle.copyWith(
                      fontSize: 13,
                      color: kYellow,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget dayAndHourWidget({required bool isProxyHave}) {
    return isProxyHave
        ? Container(
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
              child: Text(
                "5 дней 6 часов",
                style: mainSemibooextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 25,
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
              child: Text(""),
            ),
          );
  }
}

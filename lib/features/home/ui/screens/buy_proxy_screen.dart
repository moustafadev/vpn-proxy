import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/home/ui/widgets/proxy_buy_top_card.dart';
import 'package:proxy_line/features/home/ui/widgets/proxy_info_widget.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class BuyProxyScreen extends StatefulWidget {
  const BuyProxyScreen({
    Key? key,
  }) : super(key: key);
  @override
  _BuyProxyScreenState createState() => _BuyProxyScreenState();
}

class _BuyProxyScreenState extends State<BuyProxyScreen> {
  PageController topPageController = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );
  PageController bottomPageController = PageController();
  // var proxyController = Get.put(ProxyController());
  String _balance = '';

  @override
  void initState() {
    _getBalance();
    super.initState();
  }

  void _getBalance() async {
    var result = await Repository(context: context).getBalance();

    if (result != null) {
      setState(() {
        _balance = result.balance.toString();
        print(result.balance);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProxyController>(
      init: ProxyController(),
      builder: (proxyController) {
        proxyController.getCountries(context);
        return Scaffold(
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: const BoxDecoration(color: kGreyPrimary),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 14, right: 28, left: 28, bottom: 14),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Цена за штуку",
                        style: mainSemibooextStyle.copyWith(
                          fontSize: 15,
                          color: kMainGrey,
                        ),
                      ),
                      Text(
                        "\$ 6.20",
                        style: mainBoldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElvatedFillButton(
                    color: kYellow,
                    colorText: kBlack,
                    tittle: "Купить прокси",
                    onTap: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const MainSwiper(page: 0),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: kGreyPrimary,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: kGreyPrimary,
            centerTitle: true,
            toolbarHeight: 50,
            titleSpacing: 0,
            title: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 14, right: 28, left: 28, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back(result: true);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: kMainGrey,
                            size: 16,
                          ),
                          Text(
                            "Назад",
                            style: mainRegulartStyle.copyWith(
                                color: kMainGrey, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Оформление заказа",
                        style: mainBoldTextStyle.copyWith(
                            color: kWhite, fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            "\$ $_balance",
                            style: mainBoldTextStyle.copyWith(
                                color: kWhite, fontSize: 15),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/icons/cash.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      child: PageView.builder(
                        allowImplicitScrolling: true,
                        onPageChanged: (index) {
                          bottomPageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                        controller: topPageController,
                        itemCount: proxyController.listOfModels.length,
                        itemBuilder: (context, index) {
                          return ProxyTopCard(
                            proxyModel: proxyController.listOfModels[index],
                            currentInt: index,
                            cardWidth: MediaQuery.of(context).size.width * 0.8,
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: bottomPageController,
                          itemCount: proxyController.listOfModels.length,
                          itemBuilder: (context, index) {
                            return ProxyInfoWidget(
                              proxyModel: proxyController.listOfModels[index],
                              currentInt: index,
                              cardWidth: MediaQuery.of(context).size.width,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: List.generate(
                //     listOfProxyModel.length,
                //     (index) => ProxyContainer(
                //       proxyModel: listOfProxyModel[index],
                //       currentInt: index,

                //     ),
                //   ),
                // ),
                ),
          ),
        );
      },
    );
  }
}

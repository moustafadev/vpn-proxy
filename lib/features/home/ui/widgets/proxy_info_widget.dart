import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/orders/ui/screens/choose_country_screen.dart';
import 'package:proxy_line/features/home/ui/widgets/proxy_selecter_widget.dart';
import 'package:proxy_line/features/home/ui/widgets/slider_widget.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';

import 'counter_widget.dart';

class ProxyInfoWidget extends StatefulWidget {
  const ProxyInfoWidget({
    Key? key,
    required this.proxyModel,
    required this.currentInt,
    required this.cardWidth,
  }) : super(key: key);
  final ProxyModel proxyModel;
  final int currentInt;
  final double cardWidth;

  @override
  State<ProxyInfoWidget> createState() => _ProxyInfoWidgetState();
}

class _ProxyInfoWidgetState extends State<ProxyInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProxyController>(
      init: ProxyController(),
      builder: (proxyController) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "????????????",
                            style: mainSemibooextStyle.copyWith(
                              fontSize: 15,
                              color: kMainGrey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChooseCountryScreen(),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "United States of America",
                                  style: mainBoldTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/country/flag.svg",
                                  width: 24,
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: kGrey636363,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SliderPeriodWidget(),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "????????????",
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 15,
                            color: kMainGrey,
                          ),
                        ),
                        Text(
                          "${proxyController.selectSliderWidget.toInt()} ????????",
                          style: mainBoldTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "??????",
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 15,
                            color: kMainGrey,
                          ),
                        ),
                        const ProxySelecterWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "????????????????????",
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 15,
                            color: kMainGrey,
                          ),
                        ),
                        const CounterWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "???????? ???? ??????????",
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 15,
                            color: kMainGrey,
                          ),
                        ),
                        Text(
                          "\$ ${widget.proxyModel.price}",
                          style: mainBoldTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/home/controller/buy_proxy_controller.dart';
import 'package:proxy_line/features/home/ui/screens/choose_country_screen.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProxyController>(
      init: ProxyController(),
      builder: (proxyController) {
        return proxyController.loading.value
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Obx(
                    () => Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Страна",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          proxyController
                                              .countries[
                                                  proxyController.index.value]
                                              .nameRu,
                                          style: mainBoldTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.network(
                                          proxyController
                                              .countries[
                                                  proxyController.index.value]
                                              .flagUrl,
                                          width: 18,
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
                                  "Период",
                                  style: mainSemibooextStyle.copyWith(
                                    fontSize: 15,
                                    color: kMainGrey,
                                  ),
                                ),
                                Text(
                                  "${proxyController.selectSliderWidget.toInt()} дней",
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
                                  "Тип",
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
                                  "Количество",
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
                                  "Цена за штуку",
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
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

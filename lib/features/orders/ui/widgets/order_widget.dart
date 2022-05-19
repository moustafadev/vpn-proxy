import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key, required this.proxyModel}) : super(key: key);
  final ProxyModel proxyModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  width: size.width,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 21, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proxyModel.name,
                                  style: mainBoldTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "От ",
                                      style: mainRegulartStyle.copyWith(
                                          fontSize: 12, color: kMainGrey),
                                    ),
                                    Text(
                                      "19.03.2022 19:04",
                                      style: mainSemibooextStyle.copyWith(
                                          fontSize: 12, color: kMainGrey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "ID ",
                                      style: mainRegulartStyle.copyWith(
                                          fontSize: 12, color: kMainGrey),
                                    ),
                                    Text(
                                      proxyModel.id,
                                      style: mainSemibooextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Осталось ",
                                      style: mainRegulartStyle.copyWith(
                                          fontSize: 12, color: kMainGrey),
                                    ),
                                    Text(
                                      "5 дней 6 часов",
                                      style: mainSemibooextStyle.copyWith(
                                          fontSize: 12, color: kMainGrey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SvgPicture.asset(proxyModel.imagePath)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 20, bottom: 20),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Страна",
                                  style: mainRegulartStyle.copyWith(
                                      fontSize: 12, color: kMainGrey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      proxyModel.country,
                                      style: mainBoldTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: SvgPicture.asset(
                                        "assets/icons/country/flag.svg",
                                        width: 16,
                                        height: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Дней",
                                  style: mainRegulartStyle.copyWith(
                                      fontSize: 12, color: kMainGrey),
                                ),
                                Text(
                                  "${proxyModel.countOfDays}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Сумма",
                                  style: mainRegulartStyle.copyWith(
                                      fontSize: 12, color: kMainGrey),
                                ),
                                Text(
                                  "\$ ${proxyModel.price}",
                                  style: mainBoldTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
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
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );
                        },
                        child: Text(
                          "Получить",
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 13,
                            color: kYellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

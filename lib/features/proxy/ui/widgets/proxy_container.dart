import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/screen/my_proxies.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';

class ProxyContainer extends StatelessWidget {
  const ProxyContainer({
    Key? key,
    required this.proxyModel,
    required this.currentInt,
    required this.cardWidth,
  }) : super(key: key);
  final ProxyModel proxyModel;
  final int currentInt;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    double size = cardWidth;
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
                  width: size,
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
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    proxyModel.name,
                                    style: mainBoldTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    proxyModel.forText,
                                    style: mainRegulartStyle.copyWith(
                                        fontSize: 12, color: kMainGrey),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(proxyModel.imagePath)
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
                  width: size,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${proxyModel.countOfDays} дней",
                            style: mainBoldTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ ${proxyModel.price}",
                            style: mainBoldTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: size,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        pushNewScreen(context,
                            screen: const MyProxyScreen(), withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Center(
                          child: Text(
                            "Подробнее",
                            style: mainSemibooextStyle.copyWith(
                              fontSize: 13,
                              color: kYellow,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kYellow,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: kYellow.withOpacity(0.4),
                    blurRadius: 40.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 10))
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 5, right: 14, left: 14),
              child: Text(
                proxyModel.comment,
                style: mainSemibooextStyle.copyWith(
                  fontSize: 13,
                  color: kBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

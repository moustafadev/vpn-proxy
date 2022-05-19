import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
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
                                'Robokassa',
                                style: mainBoldTextStyle.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/icons/robo.svg'),
                              SvgPicture.asset('assets/icons/icons/kassa.svg')
                            ],
                          )
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Сумма",
                            style: mainRegulartStyle.copyWith(
                                fontSize: 13, color: kMainGrey),
                          ),
                          Text(
                            "\$ 10.00",
                            style: mainBoldTextStyle.copyWith(
                              fontSize: 15,
                            ),
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
                        "Заказ 4829002398",
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
    );
  }
}

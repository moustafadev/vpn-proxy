import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/speed_test/widget/progress_widget.dart';

class ResultContainer extends StatelessWidget {
  ResultContainer({Key? key}) : super(key: key);
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
          child: Padding(
            padding:
                const EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/country/flag.svg",
                  height: 32,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'United States of America',
                          style: mainBoldTextStyle.copyWith(
                            color: kWhite,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: mode ? kGrey : kReadMode.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, top: 5, bottom: 5),
                            child: Text(
                              "5 дней",
                              style: mainBoldTextStyle.copyWith(
                                color: mode ? kMainGrey : kReadMode,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: kYellow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 5, bottom: 5),
                            child: Text(
                              "IPv4",
                              style: mainBoldTextStyle.copyWith(
                                color: kBlack,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "136.117.121.183",
                          style: mainBoldTextStyle.copyWith(
                            color: kWhite,
                            fontSize: 15,
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
        const SizedBox(
          height: 1,
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
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
                      children: [
                        Text(
                          "Пинг",
                          style: mainRegulartStyle.copyWith(
                            fontSize: 15,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "4 ms",
                          style: mainRegulartStyle.copyWith(
                            fontSize: 15,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProgressWidget(
                      color: kGreenProgress,
                      result: 100,
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
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
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
                      children: [
                        Text(
                          "Скачивание",
                          style: mainRegulartStyle.copyWith(
                              fontSize: 15,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "7.11 Mbit/s",
                          style: mainRegulartStyle.copyWith(
                              fontSize: 15,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProgressWidget(
                      color: kYellowProgress,
                      result: 100,
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
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
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
                      children: [
                        Text(
                          "Загрузка",
                          style: mainRegulartStyle.copyWith(
                              fontSize: 15,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "3.09 Mbit/s",
                          style: mainRegulartStyle.copyWith(
                              fontSize: 15,
                              color: kWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProgressWidget(
                      color: kRedProgress,
                      result: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

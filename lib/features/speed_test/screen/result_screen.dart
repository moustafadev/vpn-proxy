import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController userNameController = TextEditingController();
  bool mode = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            padding: const EdgeInsets.only(right: 28, left: 28, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                        "Проверка",
                        style: mainRegulartStyle.copyWith(
                            color: kMainGrey, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.34),
                  child: Text(
                    "Результат",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 15, bottom: 15),
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
                                color:
                                    mode ? kGrey : kReadMode.withOpacity(0.2),
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
                          children: [
                            Text(
                              "Пинг",
                              style: mainRegulartStyle.copyWith(
                                  fontSize: 12, color: kMainGrey),
                            ),
                            Spacer(),
                            Text(
                              "4 ms",
                              style: mainRegulartStyle.copyWith(
                                  fontSize: 12, color: kMainGrey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 20,
                          size: 8,
                          padding: 0,
                          gradientColor: LinearGradient(
                            colors: [
                              kGreenProgress,
                              kGreenProgress,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          selectedGradientColor: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [kGreenProgress, kGreenProgress],
                            tileMode: TileMode.repeated,
                          ),
                          selectedColor: kGreenProgress,
                          unselectedColor: kBlackProgress,
                          roundedEdges: Radius.circular(10),
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
                                  'proxyModel.country',
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
    );
  }
}

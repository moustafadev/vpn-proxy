import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy_check/widget/container_head_widget.dart';

class ResultCheckScreen extends StatelessWidget {
  ResultCheckScreen({Key? key}) : super(key: key);

  bool invalid = false;
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
        toolbarHeight: 80,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 28, left: 28, bottom: 14),
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
                        style: mainBoldTextStyle.copyWith(
                            color: kWhite, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.3),
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
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBlackLight,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  ContainerHeadWidget(
                    select: false,
                    text: 'Валидные 3',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ContainerHeadWidget(
                    select: true,
                    text: 'Все',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ContainerHeadWidget(
                    select: false,
                    text: 'Валидные 6',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            width: size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "207.201.218.182",
                                    style: mainBoldTextStyle.copyWith(
                                        color: kWhite, fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: kWhite.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '9051',
                                        style: mainBoldTextStyle.copyWith(
                                            color: kWhite, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 15,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: kYellow,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'HTTPS',
                                        style: mainBoldTextStyle.copyWith(
                                            color: kBlack, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: index != 1
                                ? Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Скорость",
                                              style: mainBoldTextStyle.copyWith(
                                                  color:
                                                      kWhite.withOpacity(0.6),
                                                  fontSize: 13),
                                            ),
                                            Spacer(),
                                            Text(
                                              '0.32 сек',
                                              style: mainBoldTextStyle.copyWith(
                                                  color: kWhite, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Анонимность",
                                              style: mainBoldTextStyle.copyWith(
                                                  color:
                                                      kWhite.withOpacity(0.6),
                                                  fontSize: 13),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Высокая',
                                              style: mainBoldTextStyle.copyWith(
                                                  color: kWhite, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Center(
                                      child: Text(
                                        "Невалидный",
                                        style: mainBoldTextStyle.copyWith(
                                            color: kInvalid, fontSize: 13),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => Container(
                        height: 20,
                      ),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

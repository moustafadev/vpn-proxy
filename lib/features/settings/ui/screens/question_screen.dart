import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/settings/ui/widget/question_widgt.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool select = false;
  int indexed = 0;
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
            padding:
                const EdgeInsets.only(top: 50, right: 20, left: 28, bottom: 14),
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
                        "Настройки",
                        style: mainRegulartStyle.copyWith(
                            color: kMainGrey, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Вопрос-ответ",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Написать нам",
                      style: mainBoldTextStyle.copyWith(
                          color: kYellow, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 22, bottom: 18),
            child: Container(
              height: 65,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kBlackLight,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Найти ответ",
                      style: mainBoldTextStyle.copyWith(
                          color: kMainGrey, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/icons/search.svg',
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    indexed = index;
                    select = true;
                  });
                },
                child: QuestionWidget(
                  titleText: 'В ЧЕМ ОТЛИЧИЕ IPV4 И IPV6 ПРОКСИ?\n ЧТО ЛУЧШЕ?',
                  text:
                      "Отличие IPv4 тем что все сайты работают с данным протоколом. А с IPv6 работают не все сайты. Вы можете проверить работу сайта на IPv6 подключение пройдя по этой ссылки: https://proxy-checker.net/site-IPv6 -support/ iPv6 более подвергается банам. В основном все берут IPv4.",
                  select: indexed == index ? select : false,
                ),
              ),
              separatorBuilder: (context, index) => Container(
                height: 2,
              ),
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

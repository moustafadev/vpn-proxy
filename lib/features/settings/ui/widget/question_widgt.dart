import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget(
      {Key? key,
      required this.select,
      required this.text,
      required this.titleText})
      : super(key: key);

  String titleText;
  String text;
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kBlackLight,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  titleText,
                  maxLines: 2,
                  style:
                      mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: SvgPicture.asset(
                    select
                        ? 'assets/icons/icons/arrow_up.svg'
                        : 'assets/icons/icons/arrow_downward.svg',
                    color: kWhite,
                  ),
                ),
              ],
            ),
            if (select)
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    text,
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 13),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ContainerInfo extends StatelessWidget {
  ContainerInfo({Key? key, required this.title, required this.text, this.image})
      : super(key: key);

  String title;
  String text;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlackLight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              title,
              style: mainBoldTextStyle.copyWith(
                  color: kWhite.withOpacity(0.7), fontSize: 15),
            ),
            Spacer(),
            Row(
              children: [
                InkWell(
                  child: Text(
                    text,
                    style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                if (image != null && image != '') ...[
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    child: InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: text));
                        },
                        child: SvgPicture.asset(image!)),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}

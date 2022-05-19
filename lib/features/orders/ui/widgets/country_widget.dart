import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

// ignore: must_be_immutable
class CountryWidget extends StatelessWidget {
  CountryWidget(
      {Key? key,
      required this.assetName,
      required this.isAlphabet,
      required this.text,
      required this.isSelect,
      required this.alphabet,
      required this.onTap})
      : super(key: key);

  final String text;
  final String alphabet;
  final String assetName;
  bool isAlphabet = false;
  bool isSelect = false;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        isAlphabet
            ? Text(
                alphabet,
                style: mainBoldTextStyle.copyWith(
                  color: kYellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
        SizedBox(
          width: size.width * 0.07,
        ),
        SvgPicture.asset(
          assetName,
          width: 18,
          height: 16,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: mainBoldTextStyle.copyWith(
            color: kWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  kBlackLight,
                  isSelect ? kCyanBlue : kBlackLight,
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: isSelect
                  ? const CircleAvatar(
                      backgroundColor: kYellow,
                      radius: 8,
                    )
                  : const CircleAvatar(
                      backgroundColor: kBlackLight,
                      radius: 8,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

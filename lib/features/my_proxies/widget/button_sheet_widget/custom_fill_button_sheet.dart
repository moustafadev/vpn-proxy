import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

// ignore: must_be_immutable
class CustomFillButtonSheet extends StatelessWidget {
  CustomFillButtonSheet({Key? key, required this.color, required this.text})
      : super(key: key);

  Color color;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kBlackLight),
        child: Center(
          child: Text(
            text,
            style: mainBoldTextStyle.copyWith(color: color, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ContainerHeadWidget extends StatelessWidget {
  ContainerHeadWidget({Key? key, required this.select, required this.text})
      : super(key: key);

  bool select = true;
  String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: select ? kWhite.withOpacity(0.1) : kTrans,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: mainBoldTextStyle.copyWith(
                color: select ? kWhite : kWhite.withOpacity(0.5), fontSize: 12),
          ),
        ),
      ),
    );
  }
}

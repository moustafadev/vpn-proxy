import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      decoration: BoxDecoration(
        color: kYellowDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Нет ни одной операции',
              style: mainSemibooextStyle.copyWith(
                fontSize: 18,
                color: kYellow,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'На данный момент вы не совершали никаких операций или операция в обработке',
              style: mainSemibooextStyle.copyWith(
                  fontSize: 12, color: kWhite, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

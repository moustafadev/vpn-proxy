import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
    required this.color,
    required this.result,
  }) : super(key: key);

  final Color color;
  final double result;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
      ),
      child: Stack(
        children: [
          Container(
            height: 15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlackProgress,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            height: 15,
            width: result,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ElvatedOnlyBorderButton extends StatelessWidget {
  const ElvatedOnlyBorderButton(
      {Key? key, required this.tittle, required this.onTap})
      : super(key: key);
  final String tittle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: kBlack,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: kYellow,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          tittle,
          style: mainSemibooextStyle.copyWith(fontSize: 13, color: kBlack)
        ),
      ),
    );
  }
}

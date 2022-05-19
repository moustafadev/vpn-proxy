import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ElvatedFillButton extends StatefulWidget {
  const ElvatedFillButton({Key? key, required this.tittle, required this.onTap})
      : super(key: key);

  final String tittle;
  final Function() onTap;

  @override
  State<ElvatedFillButton> createState() => _ElvatedFillButtonState();
}

class _ElvatedFillButtonState extends State<ElvatedFillButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: kYellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(widget.tittle,
            style: mainSemibooextStyle.copyWith(fontSize: 13, color: kBlack)),
      ),
    );
  }
}

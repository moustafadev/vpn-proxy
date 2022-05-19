import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class ButtonSheetContainers extends StatelessWidget {
  ButtonSheetContainers({
    Key? key,
    required this.textEnd,
    required this.textHead,
    required this.textMedium,
    required this.onTapHead,
    required this.onTapMedium,
    required this.onTapEnd,
  }) : super(key: key);

  String textHead;
  String textMedium;
  String textEnd;
  Function() onTapHead;
  Function() onTapMedium;
  Function() onTapEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapHead,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Center(
              child: Text(
                textHead,
                style: mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        InkWell(
          onTap: onTapMedium,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Center(
                child: Text(
                  textMedium,
                  style:
                      mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        InkWell(
          onTap: onTapEnd,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(milliseconds: 300),
                    );
                  },
                  child: Text(
                    textEnd,
                    style: mainSemibooextStyle.copyWith(
                      fontSize: 13,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

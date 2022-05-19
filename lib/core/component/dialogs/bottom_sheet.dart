import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class Dialogs {
  static Future<void> showBottomSheet(BuildContext context,
      {required Widget child}) async {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        backgroundColor: kGreyPrimary,
        barrierColor: kBlack.withOpacity(0.6),
        builder: (context) {
          return child;
        });
  }
}

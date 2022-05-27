import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/dialogs/bottom_sheet.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/button_sheet_containers.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/custom_fill_button_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetInfo extends StatefulWidget {
  BottomSheetInfo({Key? key}) : super(key: key);

  @override
  State<BottomSheetInfo> createState() => _BottomSheetInfoState();
}

class _BottomSheetInfoState extends State<BottomSheetInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                  color: kBlackLight, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'IP',
                    style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF333842),
                      ),
                    ),
                    hintText: '192.168.0.1',
                    hintStyle: TextStyle(color: kWhite),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF333842),
                        width: 1,
                      ),
                    ),
                    fillColor: kBlackLight,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElvatedFillButton(
                  color: kBlackLight,
                  colorText: kYellow,
                  tittle: "Добавить",
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

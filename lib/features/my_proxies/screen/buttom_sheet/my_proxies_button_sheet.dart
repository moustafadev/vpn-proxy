import 'package:flutter/material.dart';
import 'package:proxy_line/core/component/dialogs/bottom_sheet.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/button_sheet_containers.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/custom_fill_button_sheet.dart';

class ProxiesButtonSheet extends StatelessWidget {
  const ProxiesButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
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
          CustomFillButtonSheet(
            text: 'Заметки',
            color: kWhite,
          ),
          ButtonSheetContainers(
            textEnd: 'Продлить прокси',
            textHead: 'Изменить тип',
            textMedium: 'Удалить прокси',
            onTapHead: () {},
            onTapEnd: () {},
            onTapMedium: () {},
          ),
          CustomFillButtonSheet(
            text: 'Отменить',
            color: kYellow,
          )
        ],
      ),
    );
  }
}

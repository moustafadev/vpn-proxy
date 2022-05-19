import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/button_sheet_containers.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/custom_fill_button_sheet.dart';
import '../change_type_screen.dart';
import '../delete_screen.dart';
import '../extend_screen.dart';

class FilterButtonSheet extends StatefulWidget {
  const FilterButtonSheet({Key? key}) : super(key: key);

  @override
  State<FilterButtonSheet> createState() => _FilterButtonSheetState();
}

class _FilterButtonSheetState extends State<FilterButtonSheet> {
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
          ButtonSheetContainers(
            textHead: 'Изменить тип',
            textMedium: 'Удалить',
            textEnd: 'Продлить',
            onTapHead: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangeTypeScreen(),
                ),
              );
            },
            onTapEnd: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExtendScreen(),
                ),
              );
            },
            onTapMedium: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeleteScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 7,
          ),
          CustomFillButtonSheet(
            text: 'Подробнее',
            color: kWhite,
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

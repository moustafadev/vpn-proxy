import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/dialogs/bottom_sheet.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/button_sheet_containers.dart';
import 'package:proxy_line/features/my_proxies/widget/button_sheet_widget/custom_fill_button_sheet.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarBottomSheet extends StatefulWidget {
  CalendarBottomSheet({Key? key}) : super(key: key);

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),

    //onDayTapped: (date) {},
    // readOnly: true,
    onDayTapped: (date) {},
    rangeMode: true,

    weekdayStart: DateTime.monday,
    initialDateSelected: DateTime(2020, 1, 1),
    endDateSelected: DateTime(2025, 1, 1),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.82,
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
                    'Дата создания',
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
                    hintText: '14.03.2022',
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
              ],
            ),
          ),
          Container(
            height: 400,
            child: ScrollableCleanCalendar(
              daySelectedBackgroundColorBetween: kYellow,
              dayDisableBackgroundColor: kWhite,
              calendarController: calendarController,
              dayDisableColor: kGrey,
              dayTextStyle: TextStyle(color: kWhite),
              monthTextAlign: TextAlign.left,

              weekdayTextStyle: TextStyle(color: kWhite),
              monthTextStyle: TextStyle(color: kWhite),
              layout: Layout.BEAUTY,
              locale: 'ru',
              daySelectedBackgroundColor: kYellow,
              calendarCrossAxisSpacing: 30,
              dayBackgroundColor: kWhite,
              spaceBetweenCalendars: 0,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
            child: ElvatedFillButton(
              color: kBlackLight,
              colorText: kYellow,
              tittle: "Применить",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
// Holiday will display red word
/*



 Container(
            height: 400,
            color: kWhite.withOpacity(0.04),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Positioned.fill(
                        top: constraints.maxWidth * 0.1,
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: kWhite.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Positioned(
                        child: TableCalendar(
                          firstDay: DateTime.utc(2022, 5, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          locale: 'ru',
                          headerStyle: HeaderStyle(
                            headerMargin: EdgeInsets.only(bottom: 30),
                            titleTextStyle: TextStyle(
                              color: kWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: BoxDecoration(
                              color: kTrans,
                            ),
                            formatButtonShowsNext: false,
                            formatButtonVisible: false,
                            leftChevronVisible: false,
                            rightChevronVisible: false,
                          ),
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                                color: kYellow,
                                borderRadius: BorderRadius.circular(15)),
                            defaultTextStyle: TextStyle(
                              color: kWhite,
                            ),
                            todayTextStyle: TextStyle(
                              color: kWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),


  }*/
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_border_button.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/dialogs/bottom_sheet.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/screen/buttom_sheet/filter_button_sheet.dart';
import 'package:proxy_line/features/my_proxies/screen/buttom_sheet/my_proxies_button_sheet.dart';
import 'package:proxy_line/features/my_proxies/widget/my_proxies_widget.dart';
import 'package:proxy_line/features/proxy/ui/widgets/proxy_container.dart';
import 'package:proxy_line/features/proxy_info/screen/calendar_bottom_sheet.dart';
import 'package:proxy_line/features/proxy_info/widget/bottom_sheet_info.dart';
import 'package:proxy_line/features/proxy_info/widget/container_info.dart';

class InfoFilterScreen extends StatefulWidget {
  const InfoFilterScreen({Key? key}) : super(key: key);

  @override
  State<InfoFilterScreen> createState() => _InfoFilterScreenState();
}

class _InfoFilterScreenState extends State<InfoFilterScreen> {
  List typeData = [
    'Активные',
    'Истекшие',
    'Удаленные',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kGreyPrimary,
        centerTitle: true,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: kMainGrey,
                        size: 16,
                      ),
                      Text(
                        "Мои прокси",
                        style: mainRegulartStyle.copyWith(
                            color: kMainGrey, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    "Фильтр",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Очистить",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Статус", "Показать все"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: typeData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: index == 1 ? kYellow : kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              typeData[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: index == 1 ? kBlack : kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Версия IP", ""),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 40, bottom: 15, top: 10),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              index == 1 ? 'IPv4' : 'IPv6',
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildTitle("Тип", ""),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: index == 0 ? kYellow : kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              index == 0 ? 'Индивидуальные' : 'Общие',
                              style: mainBoldTextStyle.copyWith(
                                  color: index == 0 ? kBlack : kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Цена", ""),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              index == 0 ? 'Фиксированная' : 'По курсу',
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Автопродление", ""),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 40, bottom: 15, top: 10),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: index == 2 ? kYellow : kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              autoRenewal[index].toString(),
                              style: mainBoldTextStyle.copyWith(
                                  color: index == 2 ? kBlack : kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildTitle("Дата создания", "Выбрать дату"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: creatDate.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          await Dialogs.showBottomSheet(context,
                              child: CalendarBottomSheet());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                creatDate[index],
                                style: mainBoldTextStyle.copyWith(
                                    color: kWhite,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Окончание", "Выбрать дату"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: creatDate.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              creatDate[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Окончание", "Выбрать дату"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: creatDate.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              creatDate[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("IP", "Выбрать"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 60, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: creatDate.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            childAspectRatio: 30 / (40 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          await Dialogs.showBottomSheet(context,
                              child: BottomSheetInfo());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                '192.168.0.1',
                                style: mainBoldTextStyle.copyWith(
                                    color: kWhite,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitle("Порт", "Выбрать"),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 40, bottom: 15, top: 10),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              '58654',
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildTitleWithMore("Страны", "Выбрать"),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 40, bottom: 15, top: 10),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: List.generate(
                    country.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              country[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildTitleWithMore("Теги", "Выбрать"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: tags.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              tags[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            buildTitleWithMore("Разрешенные IP", "Выбрать"),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: creatDate.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 50 / (60 / 4)),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              '192.168.0.1',
                              style: mainBoldTextStyle.copyWith(
                                  color: kWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      spreadRadius: 7.0,
                      offset: const Offset(5.0, 10.0),
                      color: kYellowDark,
                    ),
                  ],
                ),
                child: ElvatedFillButton(
                  color: kYellow,
                  colorText: kBlack,
                  tittle: "Показать прокси (3)",
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Row(
          children: [
            Text(
              title,
              style: mainBoldTextStyle.copyWith(
                  color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              text,
              style: mainBoldTextStyle.copyWith(
                  color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );
  Widget buildTitleWithMore(String title, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(
                title,
                style: mainBoldTextStyle.copyWith(
                    color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    text,
                    style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/icons/icons/arrow_right_ios.svg',
                    color: kGrey636363,
                  )
                ],
              ),
            ],
          ),
        ),
      );

  List autoRenewal = [5, 10, 20, 30];

  List creatDate = ['Сегодня', 'На этой неделе', 'В этом месяце'];

  List country = ['Россия', 'United States of America', 'China'];

  List tags = ['Тестовые', 'Лучшие прокси', 'Новые', 'Разные'];
}

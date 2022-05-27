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
import 'package:proxy_line/features/proxy_info/widget/container_info.dart';

class ProxyInfoScreen extends StatefulWidget {
  const ProxyInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProxyInfoScreen> createState() => _ProxyInfoScreenState();
}

class _ProxyInfoScreenState extends State<ProxyInfoScreen> {
  List titleData = [
    'ID заказа',
    'Страна',
    'Версия',
    'Версия',
    'IP',
    'Port',
    'Логин',
    'Пароль'
        'Тип',
  ];
  List resultData = [
    '4829002398',
    'United States of America',
    'IPv6',
    '192.0.0.1',
    '11594',
    'gJgsaH',
    'MsUpsas62',
    'HTTP'
  ];

  List typeData = [
    'Тестовые',
    'Лучшие прокси',
    'Новые прокси',
    'Разное',
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
        toolbarHeight: 90,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 14),
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
                    "О прокси",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    'assets/icons/icons/basket.svg',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Данные прокси",
                style: mainBoldTextStyle.copyWith(
                    color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            ContainerInfo(
              title: titleData[0],
              text: resultData[0],
            ),
            SizedBox(
              height: 1,
            ),
            ContainerInfo(
              title: titleData[1],
              text: resultData[1],
              image: 'assets/icons/country/flag.svg',
            ),
            SizedBox(
              height: 1,
            ),
            ContainerInfo(
              title: titleData[2],
              text: resultData[2],
            ),
            for (int i = 2; i < titleData.length - 1; i++) ...[
              SizedBox(
                height: 1,
              ),
              ContainerInfo(
                title: titleData[i],
                text: resultData[i],
                image: 'assets/icons/icons/copy.svg',
              ),
            ],
            ContainerInfo(
              title: titleData[7],
              text: resultData[7],
              image: 'assets/icons/icons/copy.svg',
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 17),
              child: ElvatedFillButton(
                tittle: 'Проверить прокси',
                color: kBlackLight,
                colorText: kYellow,
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              child: Text(
                "Дата",
                style: mainBoldTextStyle.copyWith(
                    color: kWhite, fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 10,
            ),
            ContainerInfo(
              text: '09.09.2022, 12:33',
              title: 'Заказ от',
            ),
            ContainerInfo(
              text: '09.12.2022, 12:33',
              title: 'Окончание',
            ),
            ContainerInfo(
              text: '1 месяц 10 дней',
              title: 'Осталось',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Разрешенные IP",
                    style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/icons/edit.svg')),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
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
                              "192.168.0.1",
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Теги",
                    style: mainBoldTextStyle.copyWith(
                        color: kWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Container(
                    height: 20,
                    width: 20,
                    child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/icons/edit.svg')),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 40, bottom: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  child: GridView.builder(
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
                            color: index == 1
                                ? kYellow.withOpacity(0.1)
                                : kGreenCon.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              typeData[index],
                              style: mainBoldTextStyle.copyWith(
                                  color: index == 1 ? kYellow : kGreenCon,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

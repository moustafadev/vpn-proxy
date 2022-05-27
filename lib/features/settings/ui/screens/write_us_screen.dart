import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class WriteUsScreen extends StatefulWidget {
  const WriteUsScreen({Key? key}) : super(key: key);

  @override
  State<WriteUsScreen> createState() => _WriteUsScreenState();
}

class _WriteUsScreenState extends State<WriteUsScreen> {
  TextEditingController userNameController = TextEditingController();

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
        toolbarHeight: 80,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 28, left: 28, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Настройки",
                        style: mainRegulartStyle.copyWith(
                            color: kMainGrey, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.3),
                  child: Text(
                    "Написать нам",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Тема',
              style: mainBoldTextStyle.copyWith(color: kWhite, fontSize: 18),
            ),
            SizedBox(
              height: 15,
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
            Text(
              'Сообщение',
              style: mainBoldTextStyle.copyWith(color: kWhite, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFF333842),
                  ),
                ),
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
            Text(
              'Пишите нам в онлайн чат, он находиться с правой стороны в углу. Онлайн чат работает каждый день круглосуточно.',
              style: mainBoldTextStyle.copyWith(color: kGrey, fontSize: 14),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ' Если вопросы связаны: Заменой адреса Возвратом заказов на баланс аккаунта Пишите только в онлайн чат, поддержка отвечает в течение 1 минуты, ответ на тикет может задержаться до 72ч.',
              style: mainBoldTextStyle.copyWith(color: kGrey, fontSize: 14),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
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
                  tittle: "Подтвердить",
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/constants/constant.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy_check/screen/result_check_screen.dart';

class ProxyCheck extends StatelessWidget {
  const ProxyCheck({Key? key}) : super(key: key);

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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.3),
                  child: Text(
                    "Проверка прокси",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Список прокси',
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
                'Если у вас публичные прокси (без логина и пароля), то IP:PORT',
                style: mainBoldTextStyle.copyWith(color: kGrey, fontSize: 14),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Если у вас Индивидуальные/Приватные (авторизация по логину и паролю), тогда IP:PORT:LOGIN:PASW',
                style: mainBoldTextStyle.copyWith(color: kGrey, fontSize: 14),
              ),
              SizedBox(
                height: size.height / 6,
              ),
              Container(
                width: size.width,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Row(
                              children: [
                                const CircleAvatar(
                                  radius: 2,
                                  backgroundColor: kWhite,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  check_proxy[index],
                                  style: mainBoldTextStyle.copyWith(
                                      color: kWhite, fontSize: 13),
                                ),
                              ],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: 5),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
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
                    color: kYellow,
                    colorText: kBlack,
                    tittle: "Отправить",
                    onTap: () {
                      pushNewScreen(context, screen: ResultCheckScreen());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

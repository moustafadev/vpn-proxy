import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/text_fields/custom_text_field.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/auth/ui/sign_in/screen/sign_in.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({
    Key? key,
  }) : super(key: key);
  @override
  _RecoverPageState createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGreyPrimary,
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/images/bg/bg.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/logo/logo.svg',
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      "Восстановление пароля",
                      style: mainSemibooextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "На Ваш Email будут высланы инструкции по восстановлению пароля",
                        textAlign: TextAlign.center,
                        style: mainRegulartStyle.copyWith(
                          fontSize: 14,
                          color: kMainGrey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: 'proxyline@pl.com',
                      title: 'Email',
                      controller: dataController,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    ElvatedFillButton(tittle: "Отправить", onTap: () {}),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingInPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Отменить",
                        style: mainSemibooextStyle.copyWith(
                          fontSize: 14,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

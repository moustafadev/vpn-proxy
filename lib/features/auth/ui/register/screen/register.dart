import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/text_fields/custom_text_field.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/provider/shared.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/auth/ui/code/screen/code.dart';
import 'package:proxy_line/features/auth/ui/policy_page.dart/screen/policy_page.dart';
import 'package:proxy_line/features/auth/ui/sign_in/screen/sign_in.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController dataController = TextEditingController();

  void _sendEmail() async {
    var result = await Repository(context: context)
        .verificationCode(dataController.text);

    if (result != null) {
      // if (result.success == true) {
      print('qweqwe');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CodePage(
            email: dataController.text,
          ),
        ),
      );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyPrimary,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 48,
                      ),
                      Text(
                        "Регистрация",
                        style: mainSemibooextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Пароль будет отправлен на Ваш Email",
                        style: mainRegulartStyle.copyWith(
                          fontSize: 14,
                          color: kMainGrey,
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
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Регистрируясь вы принимаете ",
                                style: mainSemibooextStyle.copyWith(
                                  fontSize: 13,
                                  color: kMainGrey,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PolicyPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "публичную оферту",
                                  style: mainSemibooextStyle.copyWith(
                                    fontSize: 13,
                                    color: kMainGrey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "и ",
                                style: mainSemibooextStyle.copyWith(
                                  fontSize: 13,
                                  color: kMainGrey,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PolicyPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "политику конфиденциальности",
                                  style: mainSemibooextStyle.copyWith(
                                    fontSize: 13,
                                    color: kMainGrey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Уже есть аккаунт?",
                            style: mainRegulartStyle.copyWith(
                              fontSize: 14,
                              color: kWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
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
                              "Авторизация",
                              style: mainSemibooextStyle.copyWith(
                                fontSize: 14,
                                color: kWhite,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElvatedFillButton(
                          color: kYellow,
                          colorText: kBlack,
                          tittle: "Зарегистрироваться",
                          onTap: () {
                            var user =
                                Provider.of<AppData>(context, listen: false)
                                    .user;
                            print(user.userId);
                            _sendEmail();
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

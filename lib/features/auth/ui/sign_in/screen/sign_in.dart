import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/text_fields/custom_text_field.dart';
import 'package:proxy_line/core/component/text_fields/custom_text_password.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/provider/shared.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/auth/ui/recover/screen/recover_page.dart';
import 'package:proxy_line/features/auth/ui/register/screen/register.dart';
import 'package:proxy_line/features/main_swiper/ui/screens/main_swiper.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({
    Key? key,
  }) : super(key: key);
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signIn() async {
    var result = await Repository(context: context).authUser(
      dataController.text,
      passwordController.text,
    );
    if (result != null) {
      print(result.userId);
      Provider.of<AppData>(context, listen: false).setUser(
        User(
          userId: result.userId.toString(),
          token: result.token,
          email: dataController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGreyPrimary,
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
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 48,
                      ),
                      Text(
                        "Авторизация",
                        style: mainSemibooextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        title: 'Email',
                        controller: dataController,
                        hintText: 'proxyline@pl.com',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextFieldPassword(
                        title: 'Пароль',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RecoverPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Забили пароль ?",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Нет аккаунта?",
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
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Регистрация",
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
                          tittle: "Войти",
                          onTap: () {
                            _signIn();
                          }),
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

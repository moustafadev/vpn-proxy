import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/component/text_fields/custom_text_field.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/provider/shared.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/auth/ui/sign_in/screen/sign_in.dart';
import 'package:proxy_line/features/main_swiper/ui/screens/main_swiper.dart';

class CodePage extends StatefulWidget {
  const CodePage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;
  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  void _checkCode() async {
    var result = await Repository(context: context)
        .createUser(widget.email, _codeController.text);

    if (result != null) {
      print('next page');
      Provider.of<AppData>(context, listen: false).setUser(
        User(
          userId: result.userId.toString(),
          token: result.token,
          email: widget.email,
        ),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainSwiper(page: 0),
          ),
          (route) => false);
    }
  }

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
                      "Введите код",
                      style: mainSemibooextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Введите код, отправленный на email указанный при регистрации (Проверяйте папку "Спам".',
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
                      hintText: '6285',
                      title: 'Код',
                      controller: _codeController,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    ElvatedFillButton(
                        tittle: "Отправить",
                        onTap: () {
                          _checkCode();
                        }),
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

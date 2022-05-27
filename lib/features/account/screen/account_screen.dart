import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppData>(context);
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
            padding:
                const EdgeInsets.only(top: 30, right: 20, left: 28, bottom: 18),
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Аккаунт",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<AppData>(context, listen: false).logOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Выйти",
                      style: mainBoldTextStyle.copyWith(
                          color: kYellow, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Данные аккаунта',
              style: mainBoldTextStyle.copyWith(color: kWhite, fontSize: 18),
            ),
          ),
          Container(
            height: 65,
            width: size.width,
            decoration: const BoxDecoration(
              color: kBlackLight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Логин",
                    style: mainBoldTextStyle.copyWith(
                        color: kMainGrey, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    provider.user.email,
                    style: mainBoldTextStyle.copyWith(
                        color: kMainGrey, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            height: 65,
            width: size.width,
            decoration: const BoxDecoration(
              color: kBlackLight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Пароль",
                    style: mainBoldTextStyle.copyWith(
                        color: kMainGrey, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "*************",
                        style: mainBoldTextStyle.copyWith(
                            color: kMainGrey, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      SvgPicture.asset(
                        "assets/icons/icons/eye_sharp.svg",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: kBlackLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Сменить пароль',
                    style: mainSemibooextStyle.copyWith(
                        fontSize: 13, color: kYellow)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

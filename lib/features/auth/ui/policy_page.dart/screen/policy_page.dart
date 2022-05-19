import 'package:flutter/material.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/core/texts/policy_text.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({
    Key? key,
  }) : super(key: key);
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  TextEditingController dataController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kGreyPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kGreyPrimary,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 8,
                bottom: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: kMainGrey,
                      ),
                      Text(
                        "Назад",
                        style: mainRegulartStyle.copyWith(
                            fontSize: 14, color: kMainGrey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Политика \nконфиденциальности",
                style:
                    mainSemibooextStyle.copyWith(fontSize: 16, color: kWhite),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            policyText,
                            textAlign: TextAlign.start,
                            style: mainRegulartStyle.copyWith(
                              fontSize: 14,
                              color: kMainGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: kGreyPrimary,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElvatedFillButton(tittle: "Принять", onTap: () {}),
                  ),
                  const SizedBox(
                    height: 16,
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

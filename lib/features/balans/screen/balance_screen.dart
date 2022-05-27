import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/balans/widgets/balance_widget.dart';
import 'package:proxy_line/features/balans/widgets/operation_widget.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key, required this.balance}) : super(key: key);
  final String balance;

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  bool operation = false;

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
          toolbarHeight: 50,
          titleSpacing: 0,
          title: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 28, left: 28, bottom: 14, top: 45),
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
                          "Назад",
                          style: mainRegulartStyle.copyWith(
                              color: kMainGrey, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.34),
                    child: Text(
                      "Ваш баланс",
                      style: mainBoldTextStyle.copyWith(
                          color: kWhite, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$',
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 20,
                            color: kMainGrey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.balance,
                          style: mainSemibooextStyle.copyWith(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 1,
              ),
              Container(
                width: size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        await Future.delayed(
                          const Duration(milliseconds: 300),
                        );
                      },
                      child: Text(
                        "Получить",
                        style: mainSemibooextStyle.copyWith(
                          fontSize: 13,
                          color: kYellow,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Операции',
                style: mainSemibooextStyle.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              operation
                  ? Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                              4, (index) => const BalanceWidget()),
                        ),
                      ),
                    )
                  : const OperationWidget(),
            ],
          ),
        ));
  }
}

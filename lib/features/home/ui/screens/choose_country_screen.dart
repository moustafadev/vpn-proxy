import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/constants/constant.dart';
import 'package:proxy_line/core/helper/cache_helper.dart';
import 'package:proxy_line/core/provider/shared.dart';
import 'package:proxy_line/core/repository/objects/countries.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/home/controller/buy_proxy_controller.dart';
import 'package:proxy_line/features/orders/ui/widgets/country_widget.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ProxyController>(
      init: ProxyController(),
      builder: (controller) {
        controller.getCountries(context);
        return Scaffold(
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: const BoxDecoration(color: kGreyPrimary),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 28, left: 28, bottom: 14),
              child: ElvatedFillButton(
                color: kYellow,
                colorText: kBlack,
                tittle: "Подтвердить",
                onTap: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
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
                            "Назад",
                            style: mainRegulartStyle.copyWith(
                                color: kMainGrey, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.32),
                      child: Text(
                        "Выбор страны",
                        style: mainBoldTextStyle.copyWith(
                            color: kWhite, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: controller.loading.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      //print(_countries[index].nameLocal);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CountryWidget(
                          alphabet: alphabets[index].toUpperCase(),
                          assetName: controller.countries[index].flagUrl,
                          text: controller.countries[index].nameRu,
                          isSelect: controller.index == index ? true : false,
                          isAlphabet: true,
                          onTap: () {
                            CacheHelper.saveData(
                                key: 'country',
                                value: controller.countries[index].code);
                            controller.chooseCountry(index);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 50,
                      color: Colors.grey.shade700,
                    ),
                    itemCount: controller.countries.length,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

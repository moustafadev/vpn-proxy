import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proxy_line/core/component/buttons/elvated_fill_button.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/my_proxies/widget/my_proxies_widget.dart';

class ChangeTypeScreen extends StatefulWidget {
  const ChangeTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChangeTypeScreen> createState() => _ChangeTypeScreenState();
}

class _ChangeTypeScreenState extends State<ChangeTypeScreen> {
  bool selectItem = false;
  bool selectAllItem = false;
  int indexed = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyPrimary,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 30),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kGreyPrimary,
        centerTitle: true,
        toolbarHeight: 50,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, right: 20, left: 28, bottom: 14),
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
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Изменить тип",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectAllItem = !selectAllItem;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Выбрать все",
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 26, bottom: 18),
            child: Container(
              height: 65,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kBlackLight,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Найти прокси",
                      style: mainBoldTextStyle.copyWith(
                          color: kMainGrey, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/icons/search.svg',
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    indexed = index;
                    selectItem = true;
                  });
                },
                child: MyProxiesWidget(
                  text: "United States of America",
                  assetName: 'assets/icons/country/flag.svg',
                  isSelect: selectAllItem
                      ? true
                      : indexed == index
                          ? selectItem
                          : false,
                  mode: true,
                  deleteScreen: false,
                  onTap: () {},
                ),
              ),
              separatorBuilder: (context, index) => Container(
                height: 7,
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

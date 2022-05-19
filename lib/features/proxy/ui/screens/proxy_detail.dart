import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';
import 'package:proxy_line/features/proxy/ui/widgets/proxy_container.dart';

class ProxyDetail extends StatefulWidget {
  final int currentIndex;
  const ProxyDetail({
    Key? key,
   required this.currentIndex,
  }) : super(key: key);
  @override
  _ProxyDetailState createState() => _ProxyDetailState();
}

class _ProxyDetailState extends State<ProxyDetail> {
  List<ProxyModel> listOfProxyModel = [];

  @override
  void initState() {
    listOfProxyModel.add(
      ProxyModel(
        comment: 'Используют до 3-х человек',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '1',
        imagePath: 'assets/icons/icons/three_man.svg',
        name: 'IPv4 Shared',
        price: 10,
        count: 5,
        country: '',
        period: 90,
        type: 'SOCKS5',
      ),
    );
    listOfProxyModel.add(
      ProxyModel(
        comment: 'Выдаются в одни руки',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '2',
        imagePath: 'assets/icons/icons/alone_icon.svg',
        name: 'IPv4 Индивидуальные',
        price: 10,
        count: 5,
        country: 'United States of America',
        period: 90,
        type: 'SOCKS5',
      ),
    );
    listOfProxyModel.add(
      ProxyModel(
        comment: 'Выдаются в одни руки',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '3',
        imagePath: 'assets/icons/icons/book_icon.svg',
        name: 'IPv6 / 32',
        price: 10,
        count: 5,
        country: 'United States of America',
        period: 90,
        type: 'SOCKS5',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kGreyPrimary,
        centerTitle: true,
        toolbarHeight: 100,
        titleSpacing: 0,
        title: SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 28, left: 28, bottom: 14),
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
                    "Оформление заказа",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "\$ 93.5 ",
                        style: mainBoldTextStyle.copyWith(
                            color: kWhite, fontSize: 15),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/icons/cash.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              listOfProxyModel.length,
              (index) => ProxyContainer(
                proxyModel: listOfProxyModel[index],
                currentInt: index,
                                        cardWidth: MediaQuery.of(context).size.width,

                

              ),
            ),
          ),
        ),
      ),
    );
  }
}

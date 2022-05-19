import 'package:flutter/material.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/orders/ui/widgets/order_widget.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    Key? key,
  }) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<ProxyModel> listOfProxyModel = [];

  @override
  void initState() {
    listOfProxyModel.add(
      ProxyModel(
        comment: 'Используют до 3-х человек',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '48290023980',
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
        id: '4829002398',
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
        id: '48290023983',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Заказы",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(right: 24,left: 24, top: 30, bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              listOfProxyModel.length,
              (index) => OrderContainer(
                proxyModel: listOfProxyModel[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

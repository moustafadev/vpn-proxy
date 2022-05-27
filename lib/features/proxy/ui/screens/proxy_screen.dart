import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:proxy_line/core/repository/objects/proxies.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/balans/screen/balance_screen.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';
import 'package:proxy_line/features/proxy/ui/widgets/proxy_container.dart';

class ProxyScreen extends StatefulWidget {
  const ProxyScreen({
    Key? key,
  }) : super(key: key);
  @override
  _ProxyScreenState createState() => _ProxyScreenState();
}

class _ProxyScreenState extends State<ProxyScreen> {
  var proxyController = Get.put(ProxyController());
  String _balance = '';
  List<ProxiesAnswer> _proxies = [];
  @override
  void initState() {
    // _getBalance();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getBalance();
    _getProxies();
    super.didChangeDependencies();
  }

  void _getBalance() async {
    var result = await Repository(context: context).getBalance();

    if (result != null) {
      setState(() {
        _balance = result.balance.toString();
        print(result.balance);
      });
    }
  }

  void _getProxies() async {
    var result = await Repository(context: context).getProxies();

    if (result != null) {
      setState(() {
        _proxies = result;
        print('object');
      });
    }
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
                    "Прокси",
                    style:
                        mainBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pushNewScreen(context,
                        screen: BalanceScreen(
                          balance: _balance,
                        ),
                        withNavBar: false);
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          "\$ $_balance",
                          style: mainBoldTextStyle.copyWith(
                              color: kWhite, fontSize: 15),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/icons/cash.svg',
                      ),
                    ],
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              proxyController.listOfModels.length,
              (index) => ProxyContainer(
                currentInt: index,
                proxyModel: proxyController.listOfModels[index],
                cardWidth: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

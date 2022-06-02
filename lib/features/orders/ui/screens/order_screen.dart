import 'package:flutter/material.dart';
import 'package:proxy_line/core/helper/cache_helper.dart';
import 'package:proxy_line/core/repository/objects/ips.dart';
import 'package:proxy_line/core/repository/objects/order.dart';
import 'package:proxy_line/core/repository/repository.dart';
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
    _getOrder();
    super.initState();
  }

  Order? _order;
  bool loading = false;
  List<Ips>? _ips = [];
  void _getOrder() async {
    var result = await Repository(context: context).getOrder();
    if (result != null) {
      setState(() {
        _order = result;
        print(result);
      });
    }
    loading = false;
    var resultIps = await Repository(context: context).getIps(
        CacheHelper.getData('country'),
        _order!.limits![0].params!.ipType!,
        _order!.limits![0].params!.ipVersion!);

    if (result != null) {
      setState(() {
        _ips = resultIps;
        print(result);
      });
    }

    setState(() => loading = true);
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
      body: loading
          ? SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 24, top: 30, bottom: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    _ips!.length,
                    (index) => OrderContainer(
                      params: _order!.limits![0].params!,
                      ip: _ips![index].ip!,
                      country: _ips![index].city!,
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

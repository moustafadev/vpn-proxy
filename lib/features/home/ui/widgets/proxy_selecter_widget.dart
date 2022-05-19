import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class ProxySelecterWidget extends StatefulWidget {
  const ProxySelecterWidget({Key? key}) : super(key: key);

  @override
  State<ProxySelecterWidget> createState() => _ProxySelecterWidgetState();
}

class _ProxySelecterWidgetState extends State<ProxySelecterWidget>
    with SingleTickerProviderStateMixin {
  var proxyController = Get.put(ProxyController());

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBlackLight, borderRadius: BorderRadius.circular(40)),
      width: 180,
      height: 35,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TabBar(
          indicatorColor: Colors.white.withOpacity(0.06),
          indicatorWeight: 2,
          indicator: BoxDecoration(
            color: kWhite.withOpacity(0.06),
            borderRadius: BorderRadius.circular(40)
          ),
          labelStyle: const TextStyle(fontSize: 12),
          controller: tabController,
          tabs: const [
            Tab(text: "HTTP(S)"),
            Tab(text: "SOCKS5"),
          ],
        ),
      ),
    );
  }
}

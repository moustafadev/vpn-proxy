import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:proxy_line/core/style/colors.dart';
import 'package:proxy_line/core/style/text_styles.dart';
import 'package:proxy_line/features/proxy/domain/controllers/proxy_controllers.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProxyController>(
      builder: (proxyController) {
        return Row(
          children: [
            Container(
                width: 45,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    proxyController.removeProxyInt();
                  },
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: kWhite,
                    size: 18,
                  )),
                )),
            const SizedBox(
              width: 1,
            ),
            Container(
              width: 45,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
              ),
              child: Center(
                  child: Text(
                proxyController.buyProxyCount.toString(),
                style: mainSemibooextStyle.copyWith(fontSize: 13),
              )),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
                width: 45,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    proxyController.addProxyInt();
                  },
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: kWhite,
                      size: 18,
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}

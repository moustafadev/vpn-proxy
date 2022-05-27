import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/provider/app_data.dart';
import 'package:proxy_line/features/auth/ui/sign_in/screen/sign_in.dart';
import 'package:proxy_line/features/main_swiper/ui/screens/main_swiper.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppData>(context);
    if (provider.user.userId == '') {
      return const SingInPage();
    }
    if (provider.user.userId != '') {
      return const MainSwiper(page: 0);
    }
    return Container();
  }
}

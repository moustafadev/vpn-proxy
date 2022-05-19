
import 'package:flutter/material.dart';
import 'package:proxy_line/features/main_swiper/ui/screens/main_swiper.dart';



class MainScreen extends StatefulWidget {
  final int swiperPage;

  const MainScreen({
    Key? key,
    required this.swiperPage,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

  }


  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return  MainSwiper(page: widget.swiperPage);
  }
}

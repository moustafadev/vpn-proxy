import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proxy_line/core/repository/objects/countries.dart';
import 'package:proxy_line/core/repository/repository.dart';
import 'package:proxy_line/features/proxy/domain/models/proxy.dart';

class ProxyController extends GetxController {
  List<ProxyModel> listOfModels = [];
  double startSliderValue = 5;
  double endSliderWidget = 365;
  double selectSliderWidget = 30;
  String selectTypeProxy = 'HTTP(S)';
  int buyProxyCount = 1;
  List<CountriesAnswer> _countries = <CountriesAnswer>[].obs;

  List<CountriesAnswer> get countries => _countries.obs;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;
  RxInt _index = 1.obs;
  RxInt get index => _index;

  chooseCountry(int index) {
    _index = index.obs;
    update();
  }

  void getCountries(BuildContext context) async {
    var result = await Repository(context: context).getCountries();
    if (result != null) {
      _countries = result;
    }
    _loading = true.obs;
  }

  void updateSelectValue(double value) {
    selectSliderWidget = value;
    update();
  }

  void addProxyInt() {
    buyProxyCount++;
    update();
  }

  void removeProxyInt() {
    if (buyProxyCount > 1) {
      buyProxyCount--;
    }
    update();
  }

  void onInitFunction() {
    listOfModels.add(
      ProxyModel(
        comment: 'Используют до 3-х человек',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '1',
        imagePath: 'assets/icons/icons/three_man.svg',
        name: 'IPv4 Shared',
        price: 200,
        count: 5,
        country: '',
        period: 90,
        type: 'SOCKS5',
      ),
    );
    listOfModels.add(
      ProxyModel(
        comment: 'Выдаются в одни руки',
        countOfDays: 5,
        forText: 'Подходят для любых целей и сайтов',
        id: '2',
        imagePath: 'assets/icons/icons/alone_icon.svg',
        name: 'IPv4 Индивидуальные',
        price: 50,
        count: 5,
        country: 'United States of America',
        period: 90,
        type: 'SOCKS5',
      ),
    );
    listOfModels.add(
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
  }

  @override
  void onInit() {
    onInitFunction();
    super.onInit();
  }
}

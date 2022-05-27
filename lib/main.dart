import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:proxy_line/core/check/check.dart';
import 'package:proxy_line/core/provider/app_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appData = await AppData.init();
  print(appData.user.token);
  print(appData.user.userId);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => appData,
        ),
      ],
      child: const MyApp(),
    ),
  );
  // configureInjection(Environment.prod);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // sliderTheme: const SliderThemeData(activeTrackColor: Colors.red),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const Check(),
    );
  }
}

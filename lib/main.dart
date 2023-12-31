import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:srilanka/content_controller.dart';
import 'package:srilanka/controllers/news_controller.dart';
import 'package:srilanka/controllers/weather_controller.dart';
import 'package:srilanka/screens/about.dart';
import 'package:srilanka/screens/faq_page.dart';
import 'package:srilanka/screens/festival_page.dart';
import 'package:srilanka/screens/gov_services_page.dart';
import 'package:srilanka/screens/news_list_page.dart';
import 'package:srilanka/screens/province_details.dart';
import 'package:srilanka/screens/full_map_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/homepage_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ContentController());
  final WeatherController wController = Get.put(WeatherController());
  final NewsController controller=Get.put(NewsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
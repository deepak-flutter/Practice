import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/hiveCustom/user.dart';
import 'package:untitled/models/news.model.dart';
import 'package:untitled/utils/language.util.dart';
import 'api/call.api.dart';
import 'helpers/sharedPreferences.helper.dart';
import 'modules/newsPage/view/newsPage.view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SharedPreferencesHelper.instance.init();
  ApiCall.configureDio();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(SourceAdapter());
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: FontFamily.),
      title: "App",
      translations: LanguageUtil(),
      locale: const Locale("hi", "IN"),
      home: NewsPageView(),
      // builder: (context, child) => ResponsiveBreakpoints.builder(
      //   child: ClampingScrollWrapper.builder(context, child!),
      //   breakpoints: [
      //     const Breakpoint(start: 0, end: 380, name: MOBILE),
      //     const Breakpoint(start: 381, end: 600, name: TABLET),
      //     const Breakpoint(start: 601, end: double.infinity, name: DESKTOP),
      //   ],
      // ),
    );
  }
}

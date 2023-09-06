//<-----**-----MainPage------***------->

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/binding.dart';
import 'routes/app_page.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const GetSolutionApp());
  });
}

class GetSolutionApp extends StatelessWidget {
  const GetSolutionApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.dmSansTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialBinding: HomeBinding(),
        initialRoute: AppRoutes.initial,
        getPages: AppPages.pages,
      );
    });
  }
}

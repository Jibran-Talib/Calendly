import 'package:calendly_clone/view/create_event_screen.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/view/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          switchTheme: SwitchThemeData(
            trackOutlineColor: MaterialStateProperty.all(Colors.white),
          ),
          iconTheme: const IconThemeData(color: Color(0xff0047ff)),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}

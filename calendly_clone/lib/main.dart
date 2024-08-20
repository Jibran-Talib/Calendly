import 'package:calendly_clone/firebase_options.dart';
import 'package:calendly_clone/view/one_off_meeting.dart';
import 'package:calendly_clone/view/welcomeScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        home: WelcomeScreen(),
      ),
    );
  }
}

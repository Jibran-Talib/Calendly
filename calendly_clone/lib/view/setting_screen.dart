import 'package:calendly_clone/view/default_screen.dart';
import 'package:calendly_clone/view/edit_profile.dart';
import 'package:calendly_clone/view/lab_screen.dart';
import 'package:calendly_clone/view/login_screen.dart';
import 'package:calendly_clone/view/notification_screen.dart';
import 'package:calendly_clone/widgets/reuseable_row.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDataFromSharePrefess();
  }

  String name = 'Loading...';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 2,
          // shadowColor: Colors.white,
          backgroundColor: Colors.white,
          bottomOpacity: 1,
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 1),
              child: Material(
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              )),
          title: const ReuseText(
            text: 'Setting',
            color: Colors.black,
            size: 20,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xff0047ff)),
          // leading: Icon(Icons.arrow_back, color: ,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 33,
                        backgroundColor: Color(0xffdd91da),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffd9d9d9),
                          child: ReuseText(
                            text: 'J',
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const EditProfile());
                          },
                          child: const ReuseText(
                            text: 'Edit profile',
                            color: Color(0xff757575),
                            size: 9,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  ReuseText(
                    text: name,
                    size: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ImageIcon(AssetImage('assets/images/arrow.png')),
                      ReuseText(
                        text: 'calendly.com/jibrantalib2121',
                        size: 12,
                        color: Color(0xff0047ff),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.66.h,
            ),
            ReuseableRow(
              text: 'Availability',
              onTap: () {},
            ),
            ReuseableRow(
                text: 'Default message',
                onTap: () {
                  Get.to(() => const DefaultScreen());
                }),
            ReuseableRow(
              text: 'Notifications',
              onTap: () {
                Get.to(() => const NotificationScreen());
              },
            ),
            ReuseableRow(
              text: 'Labs',
              onTap: () {
                Get.to(() => const LabScreen());
              },
            ),
            const ReuseableRow(text: 'Help and support'),
            const ReuseableRow(text: 'Send feedback'),
            InkWell(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: const ReuseableRow(text: 'Logout')),
            Container(
              width: double.infinity,
              height: 1.h,
              color: const Color(0xff757575),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  const ReuseText(
                    text: 'VERSION 2.20.2',
                    color: Color(0xff757575),
                    size: 7,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const ReuseText(
                        text: 'Easy',
                        color: Colors.black,
                        size: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      const ReuseText(
                        text: 'ahead',
                        color: Color(0xff0047ff),
                        size: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _loadDataFromSharePrefess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = "${prefs.getString('firstname')} ${prefs.getString('lastname')}" ??
          "No Data";
    });
  }
}

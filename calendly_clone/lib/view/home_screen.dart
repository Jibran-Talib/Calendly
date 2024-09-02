import 'dart:async';

import 'package:calendly_clone/utils/get_shareprefess_data.dart';
import 'package:calendly_clone/utils/tab_bar_index.dart';
import 'package:calendly_clone/view/create_event_screen.dart';
import 'package:calendly_clone/view/one_off_meeting.dart';
import 'package:calendly_clone/view/setting_screen.dart';
import 'package:calendly_clone/widgets/reuseable_listtile.dart';
import 'package:calendly_clone/widgets/reuseable_listtile2.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _seletedIndex = 0;
  String name = "Loading...";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDataFromSharePrefess();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 56.h,
          automaticallyImplyLeading: false,
          // elevation: 2,

          backgroundColor: const Color(0xfff5f5f5),
          // toolbarHeight: 56,
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 0),
              child: Material(
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              )),
          title: SizedBox(
            height: 37.h,
            child: const ReuseTextFormField(
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff757575),
              ),
              hintText: 'Search event types...',
              borderRadius: 30,
              enabledBorderColor: Color(0xffd9d9d9),
              focusedBorderColor: Color(0xffd9d9d9),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(const SettingScreen());
              },
              child: CircleAvatar(
                radius: 13.r,
                backgroundColor: const Color(0xffd9d9d9),
                child: Text(name[0]),
              ),
            ),
            SizedBox(
              width: 12.w,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xfff5f5f5),
            onTap: (index) {
              setState(() {
                _seletedIndex = index;
              });
            },
            currentIndex: _seletedIndex,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: _seletedIndex == 0
                    ? Image(
                        height: 17.h,
                        image: const AssetImage('assets/images/homeicon.png'))
                    : const ImageIcon(
                        AssetImage('assets/images/homeicon.png'),
                      ),
              ),
              const BottomNavigationBarItem(
                label: 'Scheduled events',
                icon: ImageIcon(AssetImage('assets/images/calendar.png')),
              ),
              const BottomNavigationBarItem(
                label: 'Notification',
                icon: ImageIcon(AssetImage('assets/images/bell.png')),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const ImageIcon(
                                AssetImage('assets/images/cross.png')))
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => CreateEventScreen());
                      },
                      child: const Reuse2Listtile(
                          iconPath: 'assets/images/pageicon.png',
                          titleText: 'One-on-one event type',
                          subtext:
                              'Create a new template for your regularly scheduled events.'),
                    ),
                    InkWell(
                      onTap: () async {
                        TabBarIndex.tabBarIndex = 0;
                        await Get.to(() => OneOffMeeting());
                      },
                      child: const Reuse2Listtile(
                          iconPath: 'assets/images/ticketicon.png',
                          titleText: 'One-on-one event type',
                          subtext:
                              'Invite someone to pick a time to meet with you.'),
                    ),
                    InkWell(
                      onTap: () async {
                        TabBarIndex.tabBarIndex = 1;
                        await Get.to(() => OneOffMeeting());
                      },
                      child: const Reuse2Listtile(
                          iconPath: 'assets/images/voteicon.png',
                          titleText: 'Meeting poll',
                          subtext:
                              'Create a poll for invites to vote on the meeting times you offer.'),
                    ),
                  ],
                ),
              ),
            ));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: const Color(0xff0047ff),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32.h,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 12.w, left: 10.h, right: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  const ReuseText(
                    text: 'YOUR EVENT TYPES',
                    color: Color(0xff757575),
                    size: 13,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.w, vertical: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 54.w,
                                      height: 11.h,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffd9d9d9),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.62.h,
                                  ),
                                  const ReuseText(
                                    text: 'Jibran',
                                    size: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 6.7.h),
                                  const ReuseText(
                                    text: 'One-on-one, 30 mins, Zoom',
                                    size: 13,
                                    color: Color(0xff757575),
                                  ),
                                  SizedBox(height: 21.h),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xffD9D9D9),
                                    radius: 12.h,
                                    child: const ReuseText(
                                      text: 'JT',
                                      color: Color(0xff757575),
                                      size: 11,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  const ReuseListTile(
                                      text: 'Copy link',
                                      iconpath: 'assets/images/copyicon.png'),
                                  const ReuseListTile(
                                      text: 'Copy single-use link',
                                      iconpath: 'assets/images/linkicon.png'),
                                  const ReuseListTile(
                                      text: 'View event type details',
                                      iconpath: 'assets/images/eyeicon.png'),
                                  const ReuseListTile(
                                      text: 'View event type details',
                                      iconpath:
                                          'assets/images/settingsicon.png'),
                                  const ReuseListTile(
                                      text: 'More share options',
                                      iconpath: 'assets/images/share2icon.png'),
                                ],
                              ),
                            ),
                          ));
                        },
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 1,
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: Container(
                            width: 331.w,
                            height: 59.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: const Color(0xffd9d9d9))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 11.w,
                                  height: 59.h,
                                  // color: Color(0xff990193),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff990193),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          bottomLeft: Radius.circular(10.r))),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // SizedBox(
                                        //   height: 12.h,
                                        // ),
                                        const ReuseText(
                                          text: '30 Minute Meeting',
                                          color: Colors.black,
                                          size: 11,
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        const ReuseText(
                                          text: 'One-on-one, 30 mins',
                                          color: Color(0xff757575),
                                          size: 9,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.47,
                                    ),
                                    CircleAvatar(
                                      radius: 12.r,
                                      backgroundColor: Color(0xffD9D9D9),
                                      child: const ReuseText(
                                        text: 'JT',
                                        color: Color(0xff757575),
                                        size: 11,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
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

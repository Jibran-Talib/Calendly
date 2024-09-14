import 'dart:async';
import 'package:calendly_clone/utils/api%20services/api_functions.dart';
import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/utils/tab_bar_index.dart';
import 'package:calendly_clone/view/create_event_screen.dart';
import 'package:calendly_clone/view/one_off_meeting.dart';
import 'package:calendly_clone/view/setting_screen.dart';
import 'package:calendly_clone/widgets/reuse_progress_indicater.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:calendly_clone/widgets/reuseable_listtile.dart';
import 'package:calendly_clone/widgets/reuseable_listtile2.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String cardName = "Loading...";

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
            appBar: _seletedIndex == 0
                ? AppBar(
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
                          Get.to(() => const SettingScreen());
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
                  )
                : AppBar(
                    // elevation: 2,
                    // shadowColor: Colors.white,
                    backgroundColor: Colors.white,
                    bottomOpacity: 1,
                    automaticallyImplyLeading: false,
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
                    title: ReuseText(
                      text: _seletedIndex == 2
                          ? 'Notifications'
                          : 'Scheduled events',
                      color: const Color(0xff757575),
                      size: 20,
                    ),
                    centerTitle: true,
                    iconTheme: const IconThemeData(color: Color(0xff0047ff)),
                    // leading: Icon(Icons.arrow_back, color: ,),
                  ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: const Color(0xff0047ff),
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
                            image:
                                const AssetImage('assets/images/homeicon.png'))
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              backgroundColor: const Color(0xff0047ff),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 32.h,
              ),
            ),
            body: _seletedIndex == 0
                ? homeScreenData()
                : _seletedIndex == 1
                    ? scheduledEvnets()
                    : notifications()));
  }

//Get Previous Sharedprefess data For get user name

  Future<void> _loadDataFromSharePrefess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = "${prefs.getString('firstname')} ${prefs.getString('lastname')}";
      cardName =
          "${prefs.getString('firstname')![0].toUpperCase()}${prefs.getString('lastname')![0].toUpperCase()}";
    });
  }

//Notification Screen widget
  Widget notifications() {
    return const Center(child: Text("Notification"));
  }

//Schedule Event Screen widget and calling Scheduled Api

  Widget scheduledEvnets() {
    return FutureBuilder(
        future: Apifunctions().getApifunc(ApiUrls.userSchedules),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: ReuseProgressIndicater(
              color: Color(0xff0047ff),
            ));
          } else if (snapshot.data!.isEmpty) {
            return const Center(
                child: ReuseText(
              text: 'No Schedule events',
              color: Colors.black,
            ));
          } else {
            List data = snapshot.data;
            var reverseData = data.reversed.toList();

            print("schdule data $data");
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var splitedDate =
                    reverseData[index]['created_at'].toString().split('T');

                print("splitedDate: $splitedDate");
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10),
                  child: Card(
                    shadowColor: Colors.grey,
                    elevation: 1,
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: const Color(0xffd9d9d9))),
                      child: SizedBox(
                        width: 331.w,
                        height: 59.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 11.w,
                              height: 59.h,
                              // color: Color(0xff990193),
                              decoration: BoxDecoration(
                                  color: const Color(0xff0047ff),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.r),
                                      bottomLeft: Radius.circular(10.r))),
                            ),
                            SizedBox(
                              width: 320.w,
                              height: 59.h,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ReuseText(
                                        textAlign: TextAlign.start,
                                        text: reverseData[index]['fullname']
                                            .toString(),
                                        color: Colors.black,
                                        size: 11,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      ReuseText(
                                        text: reverseData[index]['email']
                                            .toString(),
                                        color: const Color(0xff757575),
                                        size: 9,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  ReuseText(
                                    textAlign: TextAlign.center,
                                    text:
                                        "${splitedDate[0].toString()}\n${splitedDate[1].substring(0, 5).toString()}",
                                    color: const Color(0xff757575),
                                    size: 10,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }

//Booking Data Screen and calling Booking Api
  Widget homeScreenData() {
    return Padding(
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
          FutureBuilder(
            future: Apifunctions().getApifunc(ApiUrls.userBooking),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: ReuseProgressIndicater(
                      color: Color(0xff0047ff),
                    ),
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    const Center(
                        child: ReuseText(
                      text: 'No Data Available',
                      color: Color(0xff757575),
                    )),
                  ],
                );
              } else {
                print('snapshot state : ${snapshot.connectionState}');
                print('snapshot data : ${snapshot.data}');
                List data = snapshot.data;
                var reverseData = data.reversed.toList();

                print("data length ${data.length}");

                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var duration = reverseData[index]['duration'] >= 60
                          ? '${double.parse(reverseData[index]['duration'].toString()) / 60} hour'
                          : '${reverseData[index]['duration']} mints';
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
                                    ReuseText(
                                      text: snapshot.data[index]['title']
                                          .toString(),
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
                                      child: ReuseText(
                                        text: cardName,
                                        color: Color(0xff757575),
                                        size: 11,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(
                                          text: reverseData[index]['link']
                                              .toString(),
                                        ));
                                        ReuseSnakbar().snakbar('link copied');
                                      },
                                      child: const ReuseListTile(
                                          text: 'Copy link',
                                          iconpath:
                                              'assets/images/copyicon.png'),
                                    ),
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
                                        iconpath:
                                            'assets/images/share2icon.png'),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: const Color(0xffd9d9d9))),
                              child: SizedBox(
                                width: 331.w,
                                height: 59.h,
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
                                              bottomLeft:
                                                  Radius.circular(10.r))),
                                    ),
                                    SizedBox(
                                      width: 320.w,
                                      height: 59.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ReuseText(
                                                textAlign: TextAlign.start,
                                                text: reverseData[index]
                                                        ['title']
                                                    .toString(),
                                                color: Colors.black,
                                                size: 11,
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              ReuseText(
                                                text:
                                                    "One-on-one meeting - Time: $duration",
                                                color: const Color(0xff757575),
                                                size: 9,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          CircleAvatar(
                                            radius: 12.r,
                                            backgroundColor: Color(0xffD9D9D9),
                                            child: ReuseText(
                                              text: cardName,
                                              color: Color(0xff757575),
                                              size: 11,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

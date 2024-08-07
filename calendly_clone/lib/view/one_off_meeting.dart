import 'package:calendar_view/calendar_view.dart';

import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/view/meeting_details.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneOffMeeting extends StatefulWidget {
  const OneOffMeeting({super.key});

  @override
  State<OneOffMeeting> createState() => _OneOffMeetingState();
}

class _OneOffMeetingState extends State<OneOffMeeting> {
  DateTime initailDate = DateTime.now();
  final List<CalendarEventData> _events = [
    CalendarEventData(
      date: DateTime.now(),
      title: "Project meeting",
      description: "Today is project meeting.",
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 18, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 22),
    ),
    CalendarEventData(
      date: DateTime.now().add(Duration(days: 1)),
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 18),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 19),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
    CalendarEventData(
      date: DateTime.now(),
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 14),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17),
      title: "Football Tournament",
      description: "Go to football tournament.",
    ),
    CalendarEventData(
      date: DateTime.now().add(Duration(days: 3)),
      startTime: DateTime(
          DateTime.now().add(Duration(days: 3)).year,
          DateTime.now().add(Duration(days: 3)).month,
          DateTime.now().add(Duration(days: 3)).day,
          10),
      endTime: DateTime(
          DateTime.now().add(Duration(days: 3)).year,
          DateTime.now().add(Duration(days: 3)).month,
          DateTime.now().add(Duration(days: 3)).day,
          14),
      title: "Sprint Meeting.",
      description: "Last day of project submission for last year.",
    ),
    CalendarEventData(
      date: DateTime.now().subtract(Duration(days: 2)),
      startTime: DateTime(
          DateTime.now().subtract(Duration(days: 2)).year,
          DateTime.now().subtract(Duration(days: 2)).month,
          DateTime.now().subtract(Duration(days: 2)).day,
          14),
      endTime: DateTime(
          DateTime.now().subtract(Duration(days: 2)).year,
          DateTime.now().subtract(Duration(days: 2)).month,
          DateTime.now().subtract(Duration(days: 2)).day,
          16),
      title: "Team Meeting",
      description: "Team Meeting",
    ),
    CalendarEventData(
      date: DateTime.now().subtract(Duration(days: 2)),
      startTime: DateTime(
          DateTime.now().subtract(Duration(days: 2)).year,
          DateTime.now().subtract(Duration(days: 2)).month,
          DateTime.now().subtract(Duration(days: 2)).day,
          10),
      endTime: DateTime(
          DateTime.now().subtract(Duration(days: 2)).year,
          DateTime.now().subtract(Duration(days: 2)).month,
          DateTime.now().subtract(Duration(days: 2)).day,
          12),
      title: "Chemistry Viva",
      description: "Today is Joe's birthday.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 1.h),
                  child: Material(
                    elevation: 1,
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: const ReuseText(
                  text: 'New one-off meting',
                  color: Colors.black,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
                actions: [
                  const Icon(
                    Icons.close,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 50.h,
                child: Row(children: [
                  SizedBox(
                    width: 91.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: ReuseText(
                        text: 'Select times to share',
                        color: const Color(0xff757575),
                        size: 12.sp,
                      )),
                  SizedBox(
                    width: 18.w,
                  ),
                  SizedBox(
                      width: 100.w,
                      height: 33.h,
                      child: const ReuseButton(
                          widget: ReuseText(
                        text: 'Next',
                        color: Colors.white,
                        size: 13,
                        fontWeight: FontWeight.bold,
                      )))
                ]),
              ),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Container(
                        width: 251.w,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: EdgeInsets.all(3.h),
                          child: TabBar(
                              dividerHeight: 0,
                              tabAlignment: TabAlignment.center,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              tabs: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.black,
                                      size: 12.h,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    const ReuseText(
                                      text: 'Calendar',
                                      color: Colors.black,
                                      size: 12,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.format_list_bulleted,
                                      color: Colors.black,
                                      size: 12.h,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    const ReuseText(
                                      text: 'Meeting details',
                                      color: Colors.black,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          DayView(
                            controller: EventController()..addAll(_events),
                            minDay: DateTime(2010),
                            maxDay: DateTime(2030),
                            heightPerMinute: 1,

                            onEventTap: (events, date) => print(events),
                            initialDay: initailDate,

                            safeAreaOption: SafeAreaOption(),
                            headerStyle: HeaderStyle(
                                leftIcon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff0047ff),
                                ),
                                rightIcon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff0047ff),
                                ),
                                headerPadding: EdgeInsets.only(left: 45.w),
                                rightIconPadding: EdgeInsets.only(right: 45.w),
                                headerTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                )),
                            // dayTitleBuilder: (date) {
                            //   return Center(
                            //     child: InkWell(
                            //       onTap: () async {
                            //         final pickedDate = await showDatePicker(
                            //           context: context,
                            //           initialDate: initailDate,
                            //           firstDate: DateTime.utc(2010, 08, 22),
                            //           lastDate: DateTime.utc(2030, 08, 22),
                            //         );
                            //         print(pickedDate);

                            //         setState(() {
                            //           initailDate = pickedDate!;

                            //         });
                            //         print('return Date : $initailDate');
                            //       },
                            //       child: Container(
                            //         height: 50,
                            //         width: 300,
                            //         color: Colors.amber,
                            //         child: Center(
                            //             child: Text(initailDate.toString())),
                            //       ),
                            //     ),
                            //   );
                            // },
                          ),
                          MeetingDetails()
                        ],
                      ),
                    )
                  ]),
            )));
  }
}

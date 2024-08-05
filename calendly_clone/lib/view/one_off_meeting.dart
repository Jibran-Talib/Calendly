import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneOffMeeting extends StatefulWidget {
  const OneOffMeeting({super.key});

  @override
  State<OneOffMeeting> createState() => _OneOffMeetingState();
}

class _OneOffMeetingState extends State<OneOffMeeting> {
  // List<Meeting> _getDataSource() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(Meeting(
  //       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  //   return meetings;
  // }

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

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center, children: [
        //   SizedBox(
        //     height: 15.h,
        //   ),
        //   Center(
        //     child: Container(
        //       width: 251.w,
        //       height: 45,
        //       decoration: BoxDecoration(
        //           color: Colors.grey.shade200,
        //           borderRadius: BorderRadius.circular(10.r)),
        //       child: Padding(
        //         padding: EdgeInsets.all(3.h),
        //         child: TabBar(
        //             dividerHeight: 0,
        //             tabAlignment: TabAlignment.center,
        //             indicatorSize: TabBarIndicatorSize.tab,
        //             indicator: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(7.r),
        //             ),
        //             tabs: [
        //               Row(
        //                 children: [
        //                   Icon(
        //                     Icons.calendar_today_outlined,
        //                     color: Colors.black,
        //                     size: 12.h,
        //                   ),
        //                   SizedBox(
        //                     width: 6.w,
        //                   ),
        //                   const ReuseText(
        //                     text: 'Calendar',
        //                     color: Colors.black,
        //                     size: 12,
        //                   ),
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   Icon(
        //                     Icons.format_list_bulleted,
        //                     color: Colors.black,
        //                     size: 12.h,
        //                   ),
        //                   SizedBox(
        //                     width: 6.w,
        //                   ),
        //                   const ReuseText(
        //                     text: 'Meeting details',
        //                     color: Colors.black,
        //                     size: 12,
        //                   ),
        //                 ],
        //               ),
        //             ]),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     height: 10.h,
        //   ),
        //   Divider(
        //     color: Colors.grey.shade200,
        //   ),
        //   // body: SfCalendar(
        //   //   view: CalendarView.week,

        //   //   dataSource: MeetingDataSource(_getDataSource()),
        //   //   // by default the month appointment display mode set as Indicator, we can
        //   //   // change the display mode as appointment using the appointment display
        //   //   // mode property
        //   //   monthViewSettings: const MonthViewSettings(
        //   //       appointmentDisplayMode:
        //   //           MonthAppointmentDisplayMode.appointment),
        //   // ),
        // ]),
      ),
    ));
  }
}

// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;

//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;

//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;

//   /// Background which is equivalent to color property of [Appointment].
//   Color background;

//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

// // class MeetingDataSource extends CalendarDataSource {
// //   /// Creates a meeting data source, which used to set the appointment
// //   /// collection to the calendar
// //   MeetingDataSource(List<Meeting> source) {
// //     appointments = source;
// //   }

// //   @override
// //   DateTime getStartTime(int index) {
// //     return _getMeetingData(index).from;
// //   }

// //   @override
// //   DateTime getEndTime(int index) {
// //     return _getMeetingData(index).to;
// //   }

// //   @override
// //   String getSubject(int index) {
// //     return _getMeetingData(index).eventName;
// //   }

// //   @override
// //   Color getColor(int index) {
// //     return _getMeetingData(index).background;
// //   }

// //   @override
// //   bool isAllDay(int index) {
// //     return _getMeetingData(index).isAllDay;
// //   }

// //   Meeting _getMeetingData(int index) {
// //     final dynamic meeting = appointments![index];
// //     late final Meeting meetingData;
// //     if (meeting is Meeting) {
// //       meetingData = meeting;
// //     }

// //     return meetingData;
// //   }
// // }

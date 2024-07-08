import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _seletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 2,

        backgroundColor: const Color(0xfff5f5f5),
        // toolbarHeight: 56,
        title: const SizedBox(
          height: 37,
          child: ReuseTextFormField(
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
        actions: const [
          CircleAvatar(
            radius: 13,
            backgroundColor: Color(0xffd9d9d9),
            child: Text("J"),
          ),
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
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_work_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Scheduled events',
              icon: ImageIcon(AssetImage('assets/images/calendar.png')),
            ),
            BottomNavigationBarItem(
              label: 'Notification',
              icon: ImageIcon(AssetImage('assets/images/bell.png')),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: const Color(0xff0047ff),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                ReuseText(
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
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 1,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: Container(
                        width: 331,
                        height: 59,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffd9d9d9))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 11,
                              height: 59,
                              // color: Color(0xff990193),
                              decoration: const BoxDecoration(
                                  color: Color(0xff990193),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    ReuseText(
                                      text: '30 Minute Meeting',
                                      color: Colors.black,
                                      size: 11,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    ReuseText(
                                      text: 'One-on-one, 30 mins',
                                      color: Color(0xff757575),
                                      size: 9,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: Get.width * 0.47,
                                ),
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color(0xffD9D9D9),
                                  child: ReuseText(
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

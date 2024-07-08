import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:flutter/material.dart';

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
              label: 'Home2',
              icon: Icon(Icons.home_work_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Home3',
              icon: Icon(Icons.home_work_outlined),
            ),
          ]),
    );
  }
}

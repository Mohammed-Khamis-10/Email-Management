import 'package:flutter/material.dart';

import 'mail_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final pages = [
    MailPage(),

    Container(
      color: Colors.yellow,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.mail,
                  color: Colors.red,
                  size: 30,
                ),
                label: "Mail"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.forum_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.forum,
                  color: Colors.red,
                  size: 30,
                ),
                label: "Chat Request"),
          ],
        ),
        body: pages[currentIndex],
      ),
    );
  }
}

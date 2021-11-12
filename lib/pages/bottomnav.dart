import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insight/pages/Home.dart';
import 'package:insight/pages/Todo.dart';
import 'package:insight/pages/book_randomizer.dart';
import 'package:insight/pages/profile.dart';
import 'package:insight/pages/talk.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  void changeIndex({index}) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(selectedIndex,
          duration: const Duration(microseconds: 600), curve: Curves.linear);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              Home(),
              Todo(),
              Talk(),
              BookRandomizerScreen(),
              ProfilePage(),
            ],
          )),
          Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    changeIndex(index: selectedIndex);
                  },
                  child: SvgPicture.asset('assets/images/home.svg',
                      color: selectedIndex == 0
                          ? Colors.black
                          : Colors.black.withOpacity(0.3)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    changeIndex(index: selectedIndex);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: SvgPicture.asset('assets/images/todo.svg',
                        color: selectedIndex == 1
                            ? Colors.black
                            : Colors.black.withOpacity(0.4)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                    changeIndex(index: selectedIndex);
                  },
                  child: SvgPicture.asset('assets/images/chat.svg',
                      color: selectedIndex == 2
                          ? Colors.black
                          : Colors.black.withOpacity(0.4)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                    changeIndex(index: selectedIndex);
                  },
                  child: SvgPicture.asset('assets/images/book.svg',
                      color: selectedIndex == 3
                          ? Colors.black
                          : Colors.black.withOpacity(0.4)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                    changeIndex(index: selectedIndex);
                  },
                  child: SvgPicture.asset('assets/images/profile.svg',
                      color: selectedIndex == 4
                          ? Colors.black
                          : Colors.black.withOpacity(0.4)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

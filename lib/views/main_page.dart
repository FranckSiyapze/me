import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:me/utils/responsive.dart';
import 'package:me/views/about/about_page.dart';
import 'package:me/views/home/home_page.dart';
import '../utils/colors.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  String toUpperLower(String text, int index) {
    if (currentPage == index) {
      return capitalize(text);
    } else {
      return text.toLowerCase();
    }
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0] + input[1].toUpperCase() + input.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(),
        centerTitle: true,
      ), */
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.transparent,
              selectedHoverColor: Colors.transparent,
              selectedColor: Colors.transparent,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: kBlue,
              unselectedIconColor: kSecondary,
              unselectedTitleTextStyle: const TextStyle(color: kSecondary),
              itemOuterPadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 50,
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              backgroundColor: kBackgroundColor,
            ),
            title: Column(
              children: [
                /* ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/me2.jpg',
                  ),
                ), */
                /* CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(3), // Border radius
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/me2.jpg',
                      ),
                    ),
                  ),
                ), */
                Container(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width / 200,
                  ),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: border,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(
                        MediaQuery.of(context).size.width / 20,
                      ), // Image radius
                      child: Image.asset(
                        'assets/images/me2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    'mohada',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Home ',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                /* iconWidget: SvgPicture.asset(
                  "assets/icons/home.svg",
                  // ignore: deprecated_member_use
                  color: kSecondary,
                  height: 25,
                ), */
                icon: const Icon(Icons.home_rounded),
                /* badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ), */
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Users ',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                title: 'Files',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.file_copy_rounded),
                /* trailing: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  ),
                ), */
              ),
              SideMenuItem(
                title: 'Download',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.download),
              ),
            ],
          ), */
          (Responsive.isDesktop(context) )?
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
              top: 10,
              bottom: 10,
            ),
            margin: EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width / 3.5,
            decoration: BoxDecoration(
              color: Color(0xFF02070D),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0xFFFFFFFF).withOpacity(.1), // Custom border color
                width: 1, // Custom border width
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      currentPage = 0;
                    });
                  },
                  child: Text(
                    toUpperLower(".home()", 0),
                    style: TextStyle(
                      color:
                          (currentPage == 0) ? Colors.teal : Color(0xFFFFFFFF),
                      fontSize: (currentPage == 0) ? 19 : 17,
                      fontWeight: (currentPage == 0)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  child: Text(
                    toUpperLower(".work()", 1),
                    style: TextStyle(
                      color: (currentPage == 1)
                          ? Colors.indigo
                          : Color(0xFFFFFFFF),
                      fontSize: (currentPage == 1) ? 19 : 17,
                      fontWeight: (currentPage == 1)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      currentPage = 2;
                    });
                  },
                  child: Text(
                    toUpperLower(".about()", 2),
                    style: TextStyle(
                      color:
                          (currentPage == 2) ? Colors.red : Color(0xFFFFFFFF),
                      fontSize: (currentPage == 2) ? 19 : 17,
                      fontWeight: (currentPage == 2)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      currentPage = 3;
                    });
                  },
                  child: Text(
                    toUpperLower(".contact()", 3),
                    style: TextStyle(
                      color: (currentPage == 3)
                          ? Colors.yellow
                          : Color(0xFFFFFFFF),
                      fontSize: (currentPage == 3) ? 19 : 17,
                      fontWeight: (currentPage == 3)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                //Text(".contact()"),
              ],
            ),
          ):Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                right: MediaQuery.of(context).size.width / 10,
                bottom: MediaQuery.of(context).size.width / 30,
                top: MediaQuery.of(context).size.width / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.asset('assets/images/me2.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    color: Color(0xFF02070D),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFFFFFFFF).withOpacity(.1), // Custom border color
                      width: 1, // Custom border width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                          color:kColorText,
                          fontSize: MediaQuery.of(context).size.height / 45
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 40,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: MediaQuery.of(context).size.height / 45,
                        color: kColorText,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                currentPage = index;
              },
              //scrollBehavior: MyCustomScrollBehavior(),
              physics: AlwaysScrollableScrollPhysics(), // Enables scrolling gestures  AlwaysScrollableScrollPhysics
              scrollDirection: Axis.vertical,
              children: [
                const HomePage(),
                Container(
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                const AboutPage(),
                Container(
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

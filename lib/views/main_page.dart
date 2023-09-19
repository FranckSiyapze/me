import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
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
  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(),
        centerTitle: true,
      ), */
      backgroundColor: kkkkk,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
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
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              allowImplicitScrolling: false,
              //scrollBehavior: MyCustomScrollBehavior(),
              onPageChanged: (index) {
                sideMenu.changePage(index);
              },
              //scrollBehavior: MyCustomScrollBehavior(),
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
                Container(
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
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

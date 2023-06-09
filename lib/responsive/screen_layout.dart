import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:barbershop_app/utils/global_variable.dart';
import 'package:barbershop_app/utils/appbar.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _page = 0;
  late PageController  pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: bottomBar,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Home',
              child: Icon(
                Icons.cut,
                color: (_page == 0) ? whiteText : whiteText.withOpacity(0.5),
              ),
            ),
            label: '',
            backgroundColor: bottomBar,
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Extra Service',
              child: Icon(
                Icons.spa,
                color: (_page == 1) ? whiteText : whiteText.withOpacity(0.5),
              ),
            ),
            label: '',
            backgroundColor: bottomBar,
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Mini Shop',
              child: Icon(
                Icons.shopping_cart,
                color: (_page == 2) ? whiteText : whiteText.withOpacity(0.5),
              ),
            ),
            label: '',
            backgroundColor: bottomBar,
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Reservation',
              child: Icon(
                Icons.edit,
                color: (_page == 3) ? whiteText : whiteText.withOpacity(0.5),
              ),
            ),
            label: '',
            backgroundColor: bottomBar,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
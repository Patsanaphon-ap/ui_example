import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/bottom/bottom_controller.dart';
import 'package:presentation/src/controller/category/category_controller.dart';
import 'package:presentation/src/controller/profile/profile_controller.dart';
import 'package:presentation/src/ui/page/category/category_page.dart';
import 'package:presentation/src/ui/page/history/history_page.dart';
import 'package:presentation/src/ui/page/home/home_page.dart';
import 'package:presentation/src/ui/page/option/option_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with WidgetsBindingObserver {
  final bottomCtrl = Get.put(BottomController());
  final categoryCtrl = Get.put(CategoryController());
  final profile = Get.put(ProfileController());

  // List of pages corresponding to each tab
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryPage(),
    HistoryPage(),
    OptionPage(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Save the MediaQuery padding reference in didChangeDependencies
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: (MediaQuery.of(context).padding.bottom == 0)
            ? _floatBottomBar()
            : _bottomBar(context),
        body: _widgetOptions.elementAt(
            bottomCtrl.isSelectIndex.value), // Displays the selected page
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).padding.left + 20,
        right: MediaQuery.of(context).padding.right + 20,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: BottomNavigationBar(
          useLegacyColorScheme: false,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 32,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex:
              bottomCtrl.isSelectIndex.value, // Sets the currently selected tab
          onTap: bottomCtrl.onItemTapped, // Callback for tab tap
        ),
      ),
    );
  }

  Widget _floatBottomBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        useLegacyColorScheme: false,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 32,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex:
            bottomCtrl.isSelectIndex.value, // Sets the currently selected tab
        onTap: bottomCtrl.onItemTapped, // Callback for tab tap
      ),
    );
  }
}

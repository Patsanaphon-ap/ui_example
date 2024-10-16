import 'package:flutter/material.dart';
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
  int _selectedIndex =
      0; // Tracks the selected index for the BottomNavigationBar

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observer for lifecycle events
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Clean up the observer
    super.dispose();
  }

  // Method to handle tab taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: (MediaQuery.of(context).padding.bottom == 0)
          ? ClipRRect(
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
                currentIndex: _selectedIndex, // Sets the currently selected tab
                onTap: _onItemTapped, // Callback for tab tap
              ),
            )
          : Container(
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
                      _selectedIndex, // Sets the currently selected tab
                  onTap: _onItemTapped, // Callback for tab tap
                ),
              ),
            ),
      body: _widgetOptions
          .elementAt(_selectedIndex), // Displays the selected page
    );
  }
}

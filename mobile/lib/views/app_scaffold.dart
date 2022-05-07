import 'package:erasmus_helper/views/home_page.dart';
import 'package:erasmus_helper/views/school_page.dart';
import 'package:erasmus_helper/views/social_page.dart';
import 'package:flutter/material.dart';

/// Mother widgets of all the 3 pages (Home, School, Social), contain the bottom
/// navigation bar and its logic
class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _AppScaffold();

}
class _AppScaffold extends State<AppScaffold> {
  int _selectedPageIndex = 0;

  final pages = [
    const HomePage(),
    const SchoolPage(),
    const SocialPage()
  ];

  void _changePage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TODO : replace with the appbar widget
          title: const Text("Erasmus Helper"),
        ),
        body: Center(
            child: pages[_selectedPageIndex]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Social")
          ],
          currentIndex: _selectedPageIndex,
          onTap: _changePage,
        )
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
}


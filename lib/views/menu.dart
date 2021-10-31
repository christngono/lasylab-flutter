import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/views/activities.dart';
import 'package:lasylab_mobile_app/views/chat_background.dart';
import 'package:lasylab_mobile_app/views/home.dart';
import 'package:lasylab_mobile_app/views/research_page.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(),
          ActivitiesPage(),
          ChatBackground(),
          ResearchPage(),
        ],
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: HexColor("#58CC02"),
        unSelectedColor: HexColor("#AFAFAF"),
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 2,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'accueil',
            icon: Icons.home_outlined,
          ),
          CustomBottomBarItems(
            label: 'Activités',
            icon: Icons.local_activity_outlined,
          ),
          CustomBottomBarItems(
            label: 'Messages',
            icon: Icons.question_answer_outlined,
          ),
          CustomBottomBarItems(
            label: 'Recherche',
            icon: Icons.search_outlined,
          ),
        ],
      ),
    );
  }
}

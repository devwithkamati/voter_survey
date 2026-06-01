import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voter_survey_admin/view/member_page/member_screen.dart';
import 'package:voter_survey_admin/view/profile_page/profile_screen.dart';
import 'package:voter_survey_admin/view/survey_page/survey_screen.dart';

import '../utils/appColors.dart';
import 'compliaint_page/compliaint_screen.dart';
import 'home_page/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      HomeScreen(),
      SurveyScreen(),
      MemberScreen(),
      ComplaintScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Agar Home tab nahi hai
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return;
        }

        // Home tab hai → exit dialog
        bool? exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Exit"),
              ),
            ],
          ),
        );

        if (exit == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: IndexedStack(index: selectedIndex, children: pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.saffron.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.saffron,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              elevation: 0,
              iconSize: 26,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.how_to_vote_outlined),
                  activeIcon: Icon(Icons.how_to_vote_rounded),
                  label: "Voting",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  activeIcon: Icon(Icons.people_alt),
                  label: "Member",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.comment_bank_rounded),
                  activeIcon: Icon(Icons.comment_bank_outlined),
                  label: "Compliaint",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.person_outline),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

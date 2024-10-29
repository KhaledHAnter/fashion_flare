import '../../../Wardrope/UI/views/real_wardrope_view.dart';

import '../../../Home/UI/views/home_view.dart';
import '../../../Profile/UI/views/profile_view.dart';
import '../../../Wishlist/UI/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavHomeView extends StatefulWidget {
  const NavHomeView({super.key});

  @override
  State<NavHomeView> createState() => _NavHomeViewState();
}

class _NavHomeViewState extends State<NavHomeView> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const RealWardropeView(),
    const HomeView(),
    const WishListView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
              // print(_selectedIndex);
            });
          }
        },
        padding: const EdgeInsets.all(25),
        gap: 8.w,
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        haptic: true,
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 25.r,
            text: "Home",
          ),
          GButton(
            icon: FontAwesomeIcons.shirt,
            iconSize: 20.r,
            text: "Market",
          ),
          GButton(
            icon: Icons.favorite,
            iconSize: 25.r,
            text: "Donations",
          ),
          GButton(
            icon: Icons.person,
            iconSize: 25.r,
            text: "Profile",
          ),
        ],
      ),
    );
  }
}

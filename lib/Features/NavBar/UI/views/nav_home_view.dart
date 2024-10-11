import 'package:fashion_flare/Features/Profile/UI/views/profile_view.dart';
import 'package:fashion_flare/Features/Wardrope/UI/views/wardrobe_view.dart';
import 'package:fashion_flare/Features/Wishlist/UI/views/wishlist_view.dart';
import 'package:fashion_flare/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavHomeView extends StatefulWidget {
  const NavHomeView({super.key});

  static String id = "Nav Home";

  @override
  State<NavHomeView> createState() => _NavHomeViewState();
}

class _NavHomeViewState extends State<NavHomeView> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    const HomeView(),
    const WishListView(),
    const WardrobeView(),
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
            icon: Icons.favorite,
            iconSize: 25.r,
            text: "Wishlist",
          ),
          GButton(
            icon: FontAwesomeIcons.shirt,
            iconSize: 20.r,
            text: "Wardrobe",
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

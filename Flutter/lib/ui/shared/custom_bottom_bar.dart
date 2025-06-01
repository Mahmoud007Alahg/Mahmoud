import 'package:fl/ui/view/Home/home_screen.dart';
import 'package:fl/ui/view/List/list.dart';
import 'package:fl/ui/view/PersonalFile/personal_file.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onTap;
  final bool highlightActiveItem;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex,
    this.onTap,
    this.highlightActiveItem = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final safeIndex = (highlightActiveItem && currentIndex != null)
        ? currentIndex!
        : 0;

    return Container(
      height: screenSize.height * (82.3 / 932),
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * (16 / 430),
        vertical: screenSize.height * (16 / 932),
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: safeIndex,
        onTap: (index) {
          onTap?.call(index);
          _navigateToPage(context, index);
        },
        selectedItemColor: const Color.fromRGBO(130, 97, 208, 1),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildNavItem('assets/Icons/profile.png', 0, screenSize),
          _buildNavItem('assets/Icons/main1.png', 1, screenSize),
          _buildNavItem('assets/Icons/list.png', 2, screenSize),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String iconPath, int index, Size screenSize) {
    final isActive = highlightActiveItem && currentIndex == index;
    final iconColor = isActive
        ? const Color.fromRGBO(130, 97, 208, 1)
        : Colors.grey;

    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        child: Image.asset(
          iconPath,
          width: screenSize.width * (24 / 430),
          height: screenSize.height * (24 / 932),
        ),
      ),
      label: '',
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => PersonalFile()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HomePage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ListMenu()));
        break;
    }
  }
}

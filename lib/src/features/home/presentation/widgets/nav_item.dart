import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final Widget icon;
  final String label;
  final int index;
  final int currentIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    final appTheme = context.appTheme;
    final textColor =
        isSelected ? AppColors.primaryColor : appTheme.bottomNavUnselectedIcon;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

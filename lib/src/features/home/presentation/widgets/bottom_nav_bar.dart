import 'package:coinin_test/gen/assets.gen.dart';
import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:coinin_test/src/features/home/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';

class NavItemData {
  const NavItemData({
    required this.icon,
    required this.getLabel,
  });
  final SvgGenImage icon;
  final String Function(AppLocalizations) getLabel;
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  List<NavItemData> get _navItems => [
        NavItemData(
          icon: Assets.icons.home,
          getLabel: (loc) => loc.home,
        ),
        NavItemData(
          icon: Assets.icons.search,
          getLabel: (loc) => loc.search,
        ),
        NavItemData(
          icon: Assets.icons.history,
          getLabel: (loc) => loc.history,
        ),
        NavItemData(
          icon: Assets.icons.collection,
          getLabel: (loc) => loc.colection,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final appTheme = context.appTheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: appTheme.bottomNavBarBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.05),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      _navItems.take(2).toList().asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return NavItem(
                      icon: item.icon.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          _currentIndex == index
                              ? AppColors.primaryColor
                              : appTheme.bottomNavUnselectedIcon,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: item.getLabel(loc),
                      index: index,
                      currentIndex: _currentIndex,
                      onTap: () => setState(() => _currentIndex = index),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      _navItems.skip(2).toList().asMap().entries.map((entry) {
                    final index = entry.key + 2;
                    final item = entry.value;
                    return NavItem(
                      icon: item.icon.svg(
                        width: item.icon == Assets.icons.collection ? 20 : 24,
                        height: item.icon == Assets.icons.collection ? 20 : 24,
                        colorFilter: ColorFilter.mode(
                          _currentIndex == index
                              ? AppColors.primaryColor
                              : appTheme.bottomNavUnselectedIcon,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: item.getLabel(loc),
                      index: index,
                      currentIndex: _currentIndex,
                      onTap: () => setState(() => _currentIndex = index),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

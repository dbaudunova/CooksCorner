import 'package:cooks_corner/config/constants/assets.dart';

enum BottomNavItem {
  home,
  search,
  profile;

  String get unselectedIcons => switch (this) {
        BottomNavItem.home => Assets.homeUnselected,
        BottomNavItem.search => Assets.searchUnselected,
        BottomNavItem.profile => Assets.profileUnselected
      };

  String get selectedIcons => switch (this) {
        BottomNavItem.home => Assets.homeSelected,
        BottomNavItem.search => Assets.searchSelected,
        BottomNavItem.profile => Assets.profileSelected
      };
}

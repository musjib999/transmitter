// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:tour/shared/global/global_var.dart';
// import 'package:tour/shared/theme/colors.dart';

// class Menu extends StatefulWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   State<Menu> createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tourAppMenu.elementAt(_selectedIndex),
//       backgroundColor: AppColors.bgColor,
//       bottomNavigationBar: NavigationBar(
//         animationDuration: const Duration(seconds: 1),
//         labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//         selectedIndex: _selectedIndex, //New
//         onDestinationSelected: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         destinations: [
//           NavigationDestination(
//             icon: Icon(
//               _selectedIndex == 0 ? Ionicons.home : Ionicons.home_outline,
//               color: AppColors.primaryColor,
//             ),
//             label: '',
//           ),
//           NavigationDestination(
//             icon: Icon(
//               _selectedIndex == 1 ? Ionicons.search : Ionicons.search_outline,
//               color: AppColors.primaryColor,
//             ),
//             label: '',
//           ),
//           NavigationDestination(
//             icon: Icon(
//               _selectedIndex == 2
//                   ? Ionicons.bookmark
//                   : Ionicons.bookmark_outline,
//               color: AppColors.primaryColor,
//             ),
//             label: '',
//           ),
//           NavigationDestination(
//             icon: Icon(
//               _selectedIndex == 3
//                   ? Ionicons.settings
//                   : Ionicons.settings_outline,
//               color: AppColors.primaryColor,
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }

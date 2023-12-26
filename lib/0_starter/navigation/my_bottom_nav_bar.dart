// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../animation/wrappers.dart';
// import 'navigation_tab.dart';
// import 'state.dart';

// class MyBottomNavBar extends StatefulWidget {
//   const MyBottomNavBar({Key? key}) : super(key: key);

//   @override
//   MyBottomNavBarState createState() => MyBottomNavBarState();
// }

// class MyBottomNavBarState extends State<MyBottomNavBar> {
//   late bool thereWasTabChange;

//   @override
//   void initState() {
//     super.initState();
//     thereWasTabChange = false;
//   }

//   BottomNavigationBarItem _getBottomNavigationBarItem(
//       bool isCurrentTab, NavigationTab thisNavTab) {
//     Widget? icon =
//         isCurrentTab ? thisNavTab.tabActiveIcon : thisNavTab.tabInactiveIcon;
//     return BottomNavigationBarItem(
//       label: thisNavTab.tabName,
//       icon: isCurrentTab && thereWasTabChange
//           ? ScaleAnimationWrapper(
//               child: icon,
//             )
//           : icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     NavigationTab currentTab =
//         context.watch<CurrentTabChangeNotifier>().currentTab;

//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.blue,
//       showUnselectedLabels: false,
//       //* https://github.com/flutter/flutter/issues/86545
//       selectedFontSize: 0,
//       showSelectedLabels: false,
//       onTap: (tappedTabIndex) {
//         // cases when tapped on active tab bar item
//         if (tappedTabIndex == currentTab.index) {
//           // case when navigation stack not empty
//           if (currentTab.tabNavigationKey.currentState!.canPop()) {
//             currentTab.tabNavigationKey.currentState!
//                 .popUntil(ModalRoute.withName(currentTab.tabRoute.path));
//           }
//           // case when navigation stack empty
//           else {
//             if (currentTab.tabScrollController.hasClients) {
//               currentTab.tabScrollController.animateTo(
//                 0.0,
//                 curve: Curves.easeOut,
//                 duration: const Duration(milliseconds: 400),
//               );
//             }
//           }
//         } else {
//           thereWasTabChange = true;
//           context
//               .read<CurrentTabChangeNotifier>()
//               .changeCurrentTab(NavigationTab.values[tappedTabIndex]);
//         }
//       },
//       items: [
//         _getBottomNavigationBarItem(
//             currentTab == NavigationTab.screen, NavigationTab.screen),
//       ],
//     );
//   }
// }

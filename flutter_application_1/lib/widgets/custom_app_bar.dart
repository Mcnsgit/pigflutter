import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomAppBarNotifier extends ChangeNotifier {

  bool _isSettingsOpened = false;
  bool _isMenuOpened = false;

  bool get isMenuOpened => _isMenuOpened;
  bool get isSettingsOpened => _isSettingsOpened;

  void toggleSettings() {
    _isSettingsOpened = !_isSettingsOpened;
    notifyListeners();
  }

  void toggleMenu() {
    _isMenuOpened = !_isMenuOpened;
    notifyListeners();
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomAppBarNotifier>(
      builder: (context, appBarNotifier, child) {
        return AppBar(
          title: const Text("home"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: appBarNotifier.toggleMenu,
          ),
          actions: [
            if (appBarNotifier.isMenuOpened)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: appBarNotifier.toggleMenu,
              ),
            if (appBarNotifier.isSettingsOpened)
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: appBarNotifier.toggleSettings,
              ),
          ],
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserAppBarNotifier with ChangeNotifier {
//   bool _isSettingsOpened = false;
//   bool _isMenuOpened = false;

//   bool get isSettingsOpened => _isSettingsOpened;
//   bool get isMenuOpened => _isMenuOpened;

//   void toggleSettings() {
//     _isSettingsOpened = !_isSettingsOpened;
//     notifyListeners();
//   }

//   void toggleMenu() {
//     _isMenuOpened = !_isMenuOpened;
//     notifyListeners();
//   }
// }

// class UserAppBar extends StatelessWidget {
//   @override
//   // ignore: overridden_fields
//   final Key? key;

//   const UserAppBar({this.key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserAppBarNotifier>(
//       builder: (context, appBarNotifier, child) {
//         return AppBar(
//           title: const Text('home'),
//           leading: IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               appBarNotifier.toggleMenu();
//             },
//           ),
//           actions: [
//             if (appBarNotifier.isMenuOpened)
//               IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () {
//                   appBarNotifier.toggleMenu();
//                 },
//               ),
//             if (appBarNotifier.isSettingsOpened)
//               IconButton(
//                 icon: const Icon(Icons.filter_list),
//                 onPressed: () {
//                   appBarNotifier.toggleSettings();
//                 },
//               ),
//           ],
//         );
//       },
//     );
//   }
// }


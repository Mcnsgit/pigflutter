import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


 class BottomNavBarNotifier extends ChangeNotifier {
   int _selectedIndex = 0;

   int get selectedIndex => _selectedIndex;

   void updateSelectedIndex(int newIndex) {
     _selectedIndex = newIndex;
     notifyListeners();
   }
 }
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.goRouter});

  final GoRouter goRouter;

  // Ensure this function is within the BottomNavBar class
  void _onItemTapped(int index, BuildContext context) {
    final pageRoutes = ['/home', '/message', '/video_call', '/profile'];  // Updated '/chats' to '/message'

    if (index >= 0 && index < pageRoutes.length) {
      Navigator.pushReplacementNamed(context, pageRoutes[index]); 
      final navNotifier = Provider.of<BottomNavBarNotifier>(context, listen: false);
      navNotifier.updateSelectedIndex(index);
    }
  }

@override
Widget build(BuildContext context) {
  Provider.of<BottomNavBarNotifier>(context);
  Consumer<BottomNavBarNotifier>(
    builder: (context, navNotifier, child) => BottomNavigationBar(
      currentIndex: navNotifier.selectedIndex,
      onTap: (index) {
        final routes = ['/home', '/chats', '/video_call', '/profile'];
        Navigator.pushReplacementNamed(context, routes[index]);  // Use context to navigate
        navNotifier.updateSelectedIndex(index);
      },
      type: BottomNavigationBarType.fixed,
    ),
  );
  return Consumer<BottomNavBarNotifier>(builder: (BuildContext context, BottomNavBarNotifier value, Widget? child) { 
    return BottomAppBar(
      child: BottomNavigationBar(
        currentIndex: value.selectedIndex,
        onTap: (index) {
          final routes = ['/home', '/chats', '/video_call', '/profile'];
          Navigator.pushReplacementNamed(context, routes[index]);  // Use context to navigate
          value.updateSelectedIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_rounded),
            label: 'Video Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],)
    );
   }
  );
}

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key, required this.goRouter});

//   final GoRouter goRouter;

//   // Ensure this function is within the BottomNavBar class
//   void _onItemTapped(int index, BuildContext context) {
//     final pageRoutes = ['/home', '/chats', '/video_call', '/profile'];

//     if (index >= 0 && index < pageRoutes.length) {
//       goRouter.go(pageRoutes[index]);
//       final navNotifier = Provider.of<BottomNavBarNotifier>(context, listen: false);
//       navNotifier.updateSelectedIndex(index);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//      Provider.of<BottomNavBarNotifier>(context);

//     return Consumer<BottomNavBarNotifier>(
//       builder: (context, navNotifier, child) => BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 6,
//         child: Container(
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3)
//               ) // changes position of shadow 
//             ]
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//                 IconButton(
//                   icon: const Icon(Icons.home),
//                   color: navNotifier.selectedIndex == 0
//                     ? Colors.blue
//                     : Colors.grey,
//                   onPressed: () => _onItemTapped(0, context),
//             ),
//             IconButton(
//               icon: const Icon(Icons.chat_bubble_rounded),
//               color: navNotifier.selectedIndex == 1
//                   ? Colors.blue
//                   : Colors.grey,
//               onPressed: () => _onItemTapped(1, context),
//             ),
//             IconButton(
//               icon: const Icon(Icons.video_call_rounded),
//               color: navNotifier.selectedIndex == 2
//                   ? Colors.blue
//                   : Colors.grey,
//               onPressed: () => _onItemTapped(2, context),
//             ),
//             IconButton(
//               icon: const Icon(Icons.person),
//               color: navNotifier.selectedIndex == 3
//                   ? Colors.blue
//                   : Colors.grey,
//               onPressed: () => _onItemTapped(3, context),
//             ),
//           ],
//         ),
//       ),
//     ),
//     );
//   }    
// }

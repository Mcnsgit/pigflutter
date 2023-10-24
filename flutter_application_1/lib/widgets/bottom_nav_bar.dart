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
  void pushReplacementNamed(int index, BuildContext context) {
    final pageRoutes = ['/home', '/message', '/video_call', '/profile'];  // Updated '/chats' to '/message'

    if (index >= 0 && index < pageRoutes.length) {
      Navigator.pushReplacementNamed(context, pageRoutes[index]); 
      final navNotifier = Provider.of<BottomNavBarNotifier>(context, listen: false);
      navNotifier.updateSelectedIndex(index);
    }
  }

@override
Widget build(BuildContext context) {
  final routes = ['home', 'message', 'video_call', 'profile'];
  Provider.of<BottomNavBarNotifier>(context);
  Consumer<BottomNavBarNotifier>(
    builder: (context, navNotifier, child) => BottomNavigationBar(
      currentIndex: navNotifier.selectedIndex,
      onTap: (index) {
        goRouter.go(routes[index]);
        navNotifier.updateSelectedIndex(index);
},

      type: BottomNavigationBarType.fixed, items: const [],
    ),
  );
  return Consumer<BottomNavBarNotifier>(
    builder: (BuildContext context, BottomNavBarNotifier value, Widget? child) { 
    return BottomAppBar(
      child: BottomNavigationBar(
        currentIndex: value.selectedIndex,
        onTap: (index) {
          final routes = ['home', 'message', 'video_call', 'profile'];
          goRouter.go(routes[index]);  // Use context to navigate
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
            label: 'Messages',
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
}
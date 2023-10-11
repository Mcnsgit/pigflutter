import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBarNotifier extends ChangeNotifier {

bool _isSettingsOpened = false;
bool _isMenuOpened = false;
bool get isMenuOpened => _isMenuOpened;bool get isSettingsOpened => _isSettingsOpened;
Void toggleSettings() {
_isSettingsOpened = !_isSettingsOpened;
notifyListeners();
}
void toggleMenu() {
_isMenuOpened = !_isMenuOpened;
notifyListeners();
}
void closeMenu() {
_isMenuOpened = false;
notifyListeners();
}
void closeSettings() {
_isSettingsOpened = false;
notifyListeners();
}

}
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
const HomeAppBar({Key? key, required CustomAppBarNotifier appBarNotifier})
: super(key: key);
@override
Widget build(BuildContext context) {
return Consumer<CustomAppBarNotifier>(
builder: (context, appBarNotifier, child) {

return AppBar(

title: const Text('Custom App Bar'),

leading: IconButton(

icon: const Icon(

Icons.menu,

),
onPressed: () {

appBarNotifier.toggleMenu();

}),

actions: [

if (appBarNotifier.isMenuOpened)

IconButton(

icon: const Icon(Icons.close),

onPressed: () {

appBarNotifier.closeMenu();

},

),

if (appBarNotifier.isSettingsOpened)

IconButton(

icon: const Icon(Icons.filter_list),

onPressed: () {

appBarNotifier.toggleSettings();

},

),

],

);

},

);

}

@override

Size get preferredSize => const Size.fromHeight(kToolbarHeight);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
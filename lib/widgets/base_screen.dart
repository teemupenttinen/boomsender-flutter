import 'package:boomsender_flutter/routes/home.dart';
import 'package:boomsender_flutter/routes/new_device.dart';
import 'package:flutter/material.dart';

// import '../routes/settings.dart';

// class MenuItem {
//   final IconData icon;
//   final String label;
//   MenuItem(this.icon, this.label);
// }

// final List<MenuItem> menuItemList = <MenuItem>[
//   MenuItem(Icons.home, "Home"),
//   MenuItem(Icons.settings, "Settings"),
// ];

// final _screens = <Widget>[const Home(), const Settings()];

class BaseScreen extends StatelessWidget {
  final Widget child;
  final String title;

  const BaseScreen({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final currentIndex = ModalRoute.of(context).settings.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.displayLarge,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: child,
    );
  }
}

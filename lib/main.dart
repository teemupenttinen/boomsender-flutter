import 'package:boomsender_flutter/routes/home.dart';
import 'package:boomsender_flutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentRouteIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boom Sender',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(250, 250, 250, 0.9),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontSize: 20, color: Colors.black),
        ),
        colorScheme: const ColorScheme.dark(
          background: Color.fromRGBO(36, 35, 49, 1),
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(routes[currentRouteIndex].label),
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: Theme.of(context).textTheme.displayLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: routes[currentRouteIndex].screen,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => setState(() {
              currentRouteIndex = value;
            }),
            currentIndex: currentRouteIndex,
            type: BottomNavigationBarType.fixed,
            items: routes
                .map(
                  (e) => BottomNavigationBarItem(
                      icon: Icon(e.icon), label: e.label),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

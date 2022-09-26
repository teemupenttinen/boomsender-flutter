import 'package:boomsender_flutter/models/models.dart';
import 'package:boomsender_flutter/widgets/popup_menu.dart';
import 'package:boomsender_flutter/widgets/textfield_with_label.dart';
import 'package:boomsender_flutter/routes/new_device.dart';
import 'package:flutter/material.dart';
import './mocks/devices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boom Sender',
      theme: ThemeData(
        backgroundColor: const Color.fromRGBO(36, 35, 49, 1),
        primaryColor: const Color.fromRGBO(250, 250, 250, 0.9),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      home: const MyHomePage(title: 'Boom Sender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.headline1,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ListTile(
                  leading: Text(
                    'Devices',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewDevice()));
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: mockDevices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: const Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 57, 147, 238),
                                ),
                              ),
                            ),
                            child: ListTile(
                                leading: Text(
                                  mockDevices[index].name,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                trailing: PopupMenu(
                                    key: Key(index.toString()),
                                    onChange: (i) {
                                      print(i);
                                    })),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

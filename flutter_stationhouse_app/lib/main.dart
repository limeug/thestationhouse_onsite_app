import 'dart:io';

import 'package:flutter/material.dart';

import 'programs.dart';

void main() => runApp(OnSiteApp());

class OnSiteApp extends StatelessWidget {
  static const String _title = 'On-Site Registration App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Registration"),
            backgroundColor: Colors.orange,
            actions: [
              new IconButton(
                icon: Image.asset('assets/images/the-station-logo.png'),
                tooltip: 'Home Page',
                onPressed: () => exit(0),
              ),
            ]),
        body: ListView(children: [
          Image.asset('assets/images/the-station-logo.png',
              height: 100, width: 100),
          Center(child: Text('Banner here')),
          MyProgramsPage(),
        ]),
      ),
    );
  }
}
// to prevent the back button from closing app
/**
@override
Widget build(BuildContext context) {
  return new WillPopScope(
    onWillPop: () async => false,
    child: new Scaffold(
      appBar: new AppBar(
        title: new Text("data"),
        leading: new IconButton(
          icon: new Icon(Icons.ac_unit),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ),
  );
}
    **/

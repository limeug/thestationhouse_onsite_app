import 'dart:io';

import 'package:flutter/material.dart';

import 'pages.dart';


void main() => runApp(OnSiteApp());

class OnSiteApp extends StatelessWidget {
  static const String _title = 'On-Site Registration App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home:Scaffold(
        appBar: AppBar(title: Text("Registration"), backgroundColor: Colors.orange,
        actions: [
          new IconButton(
            icon: Image.asset('assets/images/the-station-logo.png'),
            tooltip: 'Home Page',
            onPressed: () => exit(0),
          ),
        ]),

        body:

              ListView(
                children:  [
                Image.asset('assets/images/the-station-logo.png', height: 100, width: 100),
                Center(
                    child:Text('Banner here')),
                MyProgramsPage(),
                ]
              ),
            ),

    );

  }
}


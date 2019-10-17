import 'dart:io';
import 'dart:ui' as prefix0;

import 'main.dart';

import 'package:flutter/material.dart';

class MyProgramsPage extends StatefulWidget {
  MyProgramsPage({Key key}) : super(key: key);

  @override
  Programs createState() => Programs();
}

class Programs extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Scaffold(
          key: _formKey,
          body: PageView(
            controller: _pageController,
            children: [

              //Page 1
              Scaffold(
                  body: ListView(children: [
                Center(
                  child: Text("Programs"),
                ),
                new GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text('Program 1'),
                          RaisedButton(
                            onPressed: () {
                              if (_pageController.hasClients) {
                                _pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: const Text('Button',
                                style: TextStyle(fontSize: 12)),
                          )
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text('Program 2'),
                          RaisedButton(
                            onPressed: () {},
                            child: const Text('Button',
                                style: TextStyle(fontSize: 12)),
                          )
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text('Program 3'),
                          RaisedButton(
                            onPressed: () {},
                            child: const Text('Button',
                                style: TextStyle(fontSize: 12)),
                          )
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text('Program 4'),
                          RaisedButton(
                            onPressed: () {},
                            child: const Text('Button',
                                style: TextStyle(fontSize: 12)),
                          )
                        ]),
                  ],
                ),
              ])),

              //Page 2
              Text("test"),
            ],
          ),
        ));
  }
}

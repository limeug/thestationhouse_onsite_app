import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'programs.dart';

class MyRegisterPage extends StatefulWidget {
  MyRegisterPage({Key key}) : super(key: key);
  @override
  Register createState() => Register();
}

class Register extends State<StatefulWidget> {
  //final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
        body: PageView(
            //physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
          //Page 1
          SizedBox(
            width: size.width,
            height: size.height,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text("test1"),
                    Text("test4"),
                  ]),
                  Column(children: <Widget>[
                    Text("test2"),
                  ]),
                  Column(children: <Widget>[
                    Text("test3"),
                  ]),
                ],
              ),
            ),
          Text("page 4"),
        ]));
  }
}

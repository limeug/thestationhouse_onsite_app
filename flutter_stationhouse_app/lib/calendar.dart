import 'package:flutter_app_test/register.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'programs.dart';

class MyCalendarPage extends StatefulWidget {
  MyCalendarPage({Key key}) : super(key: key);
  @override
  Calendar createState() => Calendar();
}

class Calendar extends State<StatefulWidget> {
  //final _formKey = GlobalKey<FormState>();

  //TODO set to now
  var _currentDate = DateTime(2019, 4, 26);

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
          ListView(physics: NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  width: size.width,
                  height: size.height * (2 / 3),
                  child: CalendarCarousel<Event>(
                    // use this to display list of events
                    onDayPressed: (DateTime date, List<Event> events) {
                      this.setState(() => _currentDate = date);
                      print(_getCarouselMarkedDates()
                          .getEvents(_currentDate)
                          .length);
                    },
                    //styling
                    //thisMonthDayBorderColor: Colors.transparent,
                    //selectedDayButtonColor: Color(0xFF30A9B2),
                    //selectedDayBorderColor: Color(0xFF30A9B2),
                    //selectedDayTextStyle: TextStyle(color: Colors.white),
                    //weekendTextStyle: TextStyle(color: Colors.white),
                    //daysTextStyle: TextStyle(color: Colors.white),
                    //nextDaysTextStyle: TextStyle(color: Colors.grey),
                    //prevDaysTextStyle: TextStyle(color: Colors.grey),
                    //weekdayTextStyle: TextStyle(color: Colors.grey),
                    //weekDayFormat: WeekdayFormat.short,
                    firstDayOfWeek: 0,
                    showHeader: true,
                    isScrollable: false,

                    weekFormat: false,
                    //height: 280.0,
                    selectedDateTime: _currentDate,
                    daysHaveCircularBorder: false,
                    customGridViewPhysics: NeverScrollableScrollPhysics(),
                    markedDatesMap: _getCarouselMarkedDates(),
                    markedDateWidget: Container(
                      height: 3,
                      width: 3,
                      decoration: new BoxDecoration(
                        color: Color(0xFF30A9B2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: size.width,
                    height: size.height,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: _getCarouselMarkedDates()
                          .getEvents(_currentDate)
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () => {
                                  if (_pageController.hasClients)
                                    {
                                      _pageController.animateToPage(
                                        1,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      )
                                    }
                                }, // handle your onTap here
                            child: Container(
                              height: 50,
                              child: Center(
                                  child: Text(
                                      'Event: ${_getCarouselMarkedDates().getEvents(_currentDate)[index].title}')),
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ))
              ]),
          MyRegisterPage(),
        ]));
  }

  EventList<Event> _getCarouselMarkedDates() {
    return EventList<Event>(
      events: {
        new DateTime(2019, 4, 3): [
          new Event(
            date: new DateTime(2019, 4, 3),
            title: 'Event 1',
          ),
        ],
        new DateTime(2019, 4, 5): [
          new Event(
            date: new DateTime(2019, 4, 5),
            title: 'Event 2',
          ),
        ],
        new DateTime(2019, 4, 22): [
          new Event(
            date: new DateTime(2019, 4, 22),
            title: 'Event 3',
          ),
        ],
        new DateTime(2019, 4, 24): [
          new Event(
            date: new DateTime(2019, 4, 24),
            title: 'Event 4',
          ),
        ],
        new DateTime(2019, 4, 26): [
          new Event(
            date: new DateTime(2019, 4, 26),
            title: 'Event 5',
          ),
          new Event(
            date: new DateTime(2019, 4, 26),
            title: 'Event 6',
          ),
        ],
      },
    );
  }
}

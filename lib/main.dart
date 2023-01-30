import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double seco = 00;
  double mini = 00;
  double hour = 00;
  Timer? timer;

  String time() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour % 12} :"
        "${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute} :"
        "${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second} ";
  }

  updateSeconds() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              seco = DateTime.now().second / 60;
            }));
  }

  updateminute() {
    timer = Timer.periodic(
        const Duration(minutes: 1),
        (Timer timer) => setState(() {
              mini = DateTime.now().minute / 60;
            }));
  }

  updatehour() {
    timer = Timer.periodic(
        const Duration(hours: 1),
        (Timer timer) => setState(() {
              hour = DateTime.now().hour / 24;
            }));
  }

  @override
  void initState() {
    super.initState();
    seco = DateTime.now().second / 60;
    updateSeconds();
    mini = DateTime.now().minute / 60;
    updateminute();
    hour = DateTime.now().hour % 12;
    updatehour();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DATE & TIME",
          style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          shadows: [
            Shadow(
              offset: Offset(2, 0),
              blurRadius: 10,
              color: Colors.green,
            ),
            Shadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Colors.green,
            ),
          ],
          fontWeight: FontWeight.normal,
        ),),
        elevation: 10,
        shadowColor: Colors.green.shade900,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: 10,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: const Text("I N D I A",
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 0),
                      blurRadius: 10,
                      color: Colors.green,
                    ),
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 0),
                      blurRadius: 10,
                      color: Colors.green,
                    ),
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 200,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // color: const Color(0xffEEF0F6),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: Colors.green.withOpacity(1),
                    offset: const Offset(4, 4),
                  ),
                  BoxShadow(
                    blurRadius: 13,
                    color: Colors.green.withOpacity(1),
                    offset: const Offset(-4, -4),
                  ),
                  BoxShadow(
                    blurRadius: 36,
                    color: Colors.green.withOpacity(1),
                    offset: const Offset(6, 6),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(36.0),
                      width: 360,
                      height: 360,
                      child: Center(
                        child: Text(
                          time(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 0),
                                blurRadius: 10,
                                color: Colors.green,
                              ),
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 10,
                                color: Colors.green,
                              ),
                            ],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 300.0,
                      lineWidth: 8.0,
                      percent: hour / 60,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(36.0),
                      width: 300,
                      height: 300,
                      child: Center(
                        child: Text(
                          time(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 275.0,
                      lineWidth: 8.0,
                      percent: mini,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(36.0),
                      width: 360,
                      height: 360,
                      child: Center(
                        child: Text(
                          time(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: 250.0,
                      lineWidth: 8.0,
                      // ignore: unnecessary_non_null_assertion
                      percent: seco!,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 0,
            child: Row(
              children: [
                InkWell(
                  splashColor: Colors.green,
                  highlightColor: Colors.cyan,
                  onTap: () {
                    setState(() {});
                  },
                  child: Ink(
                    child: Container(
                      margin: const EdgeInsets.only(top: 150, left: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.green,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            CupertinoIcons.globe,
                            size: 40,
                            color: Colors.green,
                          ),
                          Spacer(),
                          Text(
                            "World Clock",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Ink(
                    child: Container(
                      margin: const EdgeInsets.only(top: 150, left: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.green,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            CupertinoIcons.alarm_fill,
                            size: 40,
                            color: Colors.yellow,
                          ),
                          Spacer(),
                          Text(
                            "Alarm",
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Ink(
                    child: Container(
                      margin: const EdgeInsets.only(top: 150, left: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.green,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            CupertinoIcons.stopwatch_fill,
                            size: 40,
                            color: Colors.green,
                          ),
                          Spacer(),
                          Text(
                            "Stopwatch",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Ink(
                    child: Container(
                      margin: const EdgeInsets.only(top: 150, left: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.green,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            CupertinoIcons.timer,
                            size: 40,
                            color: Colors.green,
                          ),
                          Spacer(),
                          Text(
                            "Timer",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

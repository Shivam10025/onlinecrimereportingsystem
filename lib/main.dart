import 'package:flutter/material.dart';
import 'package:onlinecrimereportingsystem/Screesns/chistory.dart';
import 'package:onlinecrimereportingsystem/Screesns/complaintable.dart';
import 'package:onlinecrimereportingsystem/Screesns/headquarter.dart';
import 'package:onlinecrimereportingsystem/Screesns/login.dart';
import 'package:onlinecrimereportingsystem/Screesns/loginhead.dart';
import 'package:onlinecrimereportingsystem/Screesns/loginpolice.dart';
import 'package:onlinecrimereportingsystem/Screesns/policedata.dart';
import 'package:onlinecrimereportingsystem/Screesns/report.dart';

import 'Screesns/home.dart';
import 'Screesns/regs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crime Reporting',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
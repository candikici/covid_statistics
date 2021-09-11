import 'package:covid_statistics/constants/general_constants.dart';
import 'package:covid_statistics/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Statistics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primaryBlack,
          scaffoldBackgroundColor: Color(0xFFE5E5E5),
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: TabsScreen(),
    );
  }
}

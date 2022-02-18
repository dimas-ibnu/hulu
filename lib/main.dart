import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulu_app/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Theme demo",
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const DefaultTabController(
        length: 4,
        child: Dashboard(),
      ),
    );
  }
}

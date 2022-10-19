import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(facebook());

class facebook extends StatelessWidget {
  const facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(fontSize: 30.0, fontStyle: FontStyle.normal),
              headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.normal),
              subtitle2: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.abhayaLibre().fontFamily,
                  color: Colors.red),
            ),
      ),
    );
  }
}

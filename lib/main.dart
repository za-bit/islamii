import 'package:flutter/material.dart';
import 'package:islamii/routes/hadeth_details/hadeth_details.dart';
import 'package:islamii/routes/home/home.dart';
import 'package:islamii/routes/sura_details/sura_details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        Home.routeName :(_) => Home(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),
      },
      initialRoute: Home.routeName,
    );
  }
}

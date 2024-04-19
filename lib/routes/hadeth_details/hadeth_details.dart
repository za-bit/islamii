import 'package:flutter/material.dart';


import '../../model/Hadeth.dart';
import '../../utils/app_colors.dart';

class HadethDetails extends StatelessWidget {
 static String routeName="hadeth details";

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home_bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  hadeth.title,
                  style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Text(hadeth.content,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
          ),
      ),
    );
  }
}

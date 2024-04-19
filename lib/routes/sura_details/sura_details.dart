import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../model/sura_details_args.dart';
import '../../utils/app_colors.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "sura details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraLines.isEmpty) {
      readSuraContent(args.fileName);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home_bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              args.suraName,
              style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: suraLines.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Text(
                      "(${index+1}) ${suraLines[index]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                    );
                  },
            separatorBuilder: (context, index) {
              return Divider(height: 3,thickness: 3,color: AppColors.primaryColor,);
            },
                  itemCount: suraLines.length,
                )),
    );
  }

  readSuraContent(String fileName) async {
    var suraContent = await rootBundle.loadString("assets/files/$fileName");
    suraLines = suraContent.trim().split("\n");
    setState(() {});
  }
}

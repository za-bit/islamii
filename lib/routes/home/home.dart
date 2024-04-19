import 'package:flutter/material.dart';
import 'package:islamii/routes/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islamii/routes/home/tabs/quran/quran_tab.dart';
import 'package:islamii/routes/home/tabs/radio/radio_tab.dart';
import 'package:islamii/routes/home/tabs/sebha/sebha_tab.dart';
import 'package:islamii/routes/home/tabs/settings/settings.dart';

import '../../utils/app_colors.dart';


class Home extends StatefulWidget {
   static String routeName="home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int currentTap=0;
   List<Widget>tabs=[
     QuranTab(),
     AhadethTab(),
     SebhaTab(),
     RadioTab(),
     SettingsTab(),
   ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/home_bg.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Colors.transparent,
          centerTitle: true,
          title:Text("islami",style: TextStyle(color: AppColors.accentColor,fontWeight: FontWeight.bold,fontSize: 30),) ,
        ),
         body: tabs[currentTap],
         bottomNavigationBar: Theme(
           data:Theme.of(context).copyWith(canvasColor: AppColors.primaryColor) ,
           child: BottomNavigationBar(
             currentIndex: currentTap,
             onTap: (tappedTap){
               currentTap=tappedTap;
               setState(() {});
             },
             showUnselectedLabels: false,
             selectedFontSize: 12,
             iconSize: 36,
             selectedItemColor: AppColors.accentColor,
             items: const [
               BottomNavigationBarItem(label:"Quran" , icon:ImageIcon(
                 AssetImage("assets/ic_quran.png")
               )
               ),
               BottomNavigationBarItem(label:"Ahadeth" , icon: ImageIcon(AssetImage("assets/ic_ahadeth.png")
               )
               ),
               BottomNavigationBarItem(label: "Sebha", icon: ImageIcon(AssetImage("assets/ic_sebha.png")
               )
               ),
               BottomNavigationBarItem(label:"Radio" , icon: ImageIcon(AssetImage("assets/ic_radio.png")
               )
               ),
               BottomNavigationBarItem(label:"Setting" , icon:Icon(Icons.settings)

               ),
             ],
           ),
         ),

      ),
    );
  }
}

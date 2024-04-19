import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';


class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1,right: 18,left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           // Spacer(flex: 2,),
            Text("Language",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
            SizedBox(height: 22,),
            //getRowOption("English"),
            SizedBox(height: 22,),
            Text("Mode",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
            SizedBox(height: 22,),
           // getRowOption("Light"),
           // Spacer(flex: 8,),
          ],
        ),
      ),
    );
  }

  Widget getRowOption(String selectedOption,Function onRowPressed) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white,
      border: Border.all(color: AppColors.primaryColor)
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(selectedOption,style: TextStyle(color: AppColors.primaryColor,fontSize: 14),),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

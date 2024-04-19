import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../../model/Hadeth.dart';
import '../../../../utils/app_colors.dart';
import '../../../hadeth_details/hadeth_details.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  // List<String> ahadethTitles = [];
   List<Hadeth>ahadethList=[];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty){
    readAhadethFile();}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 35, child: Image.asset("assets/ahadeth_tab_logo.png")),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: 3,
          thickness: 3,
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          height: 4,
        ),
        const Text("Ahadeth",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 25,
                fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 3,
          thickness: 3,
          color: AppColors.primaryColor,
        ),
        Expanded(
          flex: 65,
          child: ListView.separated(
            itemCount:ahadethList.length,
            itemBuilder: (context, index) {
              return buildHadethItem(context,index);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 3,
                thickness: 3,
                color: AppColors.primaryColor,
              );
            },

          ),
        ),
      ],
    );
  }

  readAhadethFile() async {
    String hadethFile =
        await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> ahadeth = hadethFile.split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLines = ahadeth[i].trim().split("\n");
      String title = singleHadethLines.removeAt(0);
      //ahadethTitles.add(title);
      String content = singleHadethLines.join("\n");
      //ahadethContent.add(content);
      ahadethList.add(Hadeth(title, content));
    }
    setState(() {

    });
  }

   Widget buildHadethItem(BuildContext context,int index){
     return InkWell(
       onTap: () {
         Navigator.pushNamed(context, HadethDetails.routeName,
           arguments:ahadethList[index]);
       },
       child: Text(ahadethList[index].title,
           textAlign: TextAlign.center,
           style: TextStyle(
               color: AppColors.accentColor,
               fontSize: 25,
               fontWeight: FontWeight.bold)),
     );
   }
}

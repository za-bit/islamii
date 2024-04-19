import 'package:flutter/material.dart';

import '../../../../model/sura_details_args.dart';
import '../../../../utils/app_colors.dart';
import '../../../sura_details/sura_details.dart';


class QuranTab extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 35, child: Image.asset("assets/quran_tab_logo.png")),
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
          const Text("Sura name",
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
              itemBuilder: (context, index) {
                return buildSuraNameItem(context,index);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 3,
                  thickness: 3,
                  color: AppColors.primaryColor,
                );
              },
              itemCount: suraNames.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildSuraNameItem(BuildContext context,int index){
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, SuraDetails.routeName,
          arguments:SuraDetailsArgs("${index+1}.txt", suraNames[index]),);
        },
        child: Text(suraNames[index],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      );
  }
}

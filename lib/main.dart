import 'package:apisecondproject/screen/details.dart';
import 'package:apisecondproject/screen/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/article_controller.dart';
Future<void> main() async{
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      // initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: NewsScreen(),
      // home: DetailsScreen(description: 'Pfizer and BioNTech filed a request with the US Food and Drug Administration in the first week of February for an emergency \n\nuse authorization of their vaccine in children 6 months to 5 years old. The FDA\'s Vaccines and Related Biological Products Advisory Committee was scheduled to meet February 15 to go over data from vaccine trials and make a recommendation on whether a two-dose vaccine regimen should be authorized.But the FDA announced Friday that it had postponed the meeting because "new data have recently emerged. The data supported the safety of the vaccines but showed disappointing effectiveness, the Washington Post reported Friday.The agency needs \n\nto see data from an ongoing trial of a third vaccine dose in these younger children in order to move forward with emergency use authorization, Dr. Peter Marks, director of the FDA\'s Center for Biologics \nEvaluation and Research, said during a news briefing"', image: 'https://cdni.rt.com/media/pics/2022.02/l/620a01e2423604646572c03d.jpg', title: 'Covid-19 vaccine authorization for younger children delayed as FDA seeks more data',),
    );
  }
}

// jokhn amra kno ekta list e click korbo tokhon amra notun screen e jabo, sei kaj ta ekhane korbo
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/L17_all_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/L17_all_styles.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key}); // "{super.key}" eta hocche ekhankar argument, GetX use korle ei argument pathanor proyojon nai
                                        // GetX amader argument subidha dey alada kore, oitai amra main page e use korbo.

  @override
  Widget build(BuildContext context) {
    // onTap: () {    // eta "L17_homeScreen_with_alert_Dialogue_box.dart" theke dhakka deya hoyeche, ei page e receive korchi
    //   Get.to(NoteDetailsScreen(), arguments: {
    //     "title": homeController.notes[index].title,
    //     "description": homeController.notes[index].description,
    //     "date": homeController.notes[index].date
    //   });
    // }// eta map akare jacche ja ekta map
    // ei // deya part tuku "L17_homeScreen_with_Alert_Dialogue_Box.dart" file e ache
    // ebar etake ei page e receive korte hobe
    final note123 = Get.arguments;        // ei arguments er vitor ukto map ta purotai ache, ja ei page ei body er vitor show korabo

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.brownColor,
        // jodio automatic back button ase kintu setar color amader like nao hote pari tai
        leading: InkWell(
          onTap: () => Get.back(),  // Get.to() dara onno page e jaoyar navigate kori, Get.back() dara ager page e back kori
                                    // Get.Ofall() ache eta use korle ar ager page e fire aste parbo na,
                                    // mane Get.Ofall() use kore navigate korle ager page gulo stack theke remove hoye jay
          child: Icon(Icons.arrow_back,color: AllColors.whiteColor,),
        ),
        title: Text("Note Details",style: AllStyles.titleStyle.copyWith(color: AllColors.whiteColor),),
        actions: [
          GestureDetector(
           onTap: (){
             // copy korar jonno ekhane amader clipbord nite hobe
             Clipboard.setData(ClipboardData(text: note123["description"]));   // sudhu matro deccription er data ta coppy hobe
           // ekhon ekta tost message dekhabo ja snakebar message er motoi
             Fluttertoast.showToast(msg: "Description Coppied");
           },
            child: Icon(Icons.copy, color: AllColors.whiteColor,),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: ()async{   // ekhane asynchronous(async) kore nite hobe share use korar jonno, niche await o use korte hobe
              // ekhane share er option add korbo
             await Share.share(note123["description"]);
            },
            child: Icon(Icons.share, color: AllColors.whiteColor,),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note123["title"], style: AllStyles.headingStyle,),
              Text(note123["date"], style:AllStyles.subtitleStyle.copyWith(color: AllColors.blackColor.withOpacity(0.6)),),
              SizedBox(height: 10,),
              Text(note123["description"],style: AllStyles.titleStyle.copyWith(color: AllColors.blackColor.withOpacity(0.8))),
              // "..." er vitor must be map er je key niyechi ta thakbe
            ],
          ),
        ),
      ),
    );
  }
}

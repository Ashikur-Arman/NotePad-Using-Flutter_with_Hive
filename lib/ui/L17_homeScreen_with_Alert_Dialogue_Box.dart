import 'package:flutter/material.dart';
import '../controllers/L17_home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/L17_note_models.dart';
import '../utils/L17_all_colors.dart';
import '../utils/L17_all_styles.dart';
import 'L17_note_details_screen_with_Gesture_Detector.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   HomeController homeController = Get.put(HomeController());  // Get.put ফাংশনটি ওই অবজেক্টকে GetX এর মেমোরিতে সংরক্ষণ করে।,
   // HomeController ক্লাসের একটি নতুন ইন্সট্যান্স বা অবজেক্ট তৈরি করা হচ্ছে। HomeController ache "L17_home_controller.dart" er moddhe
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();    // ei nicher 2 ta controller er object banai nilam, niche just call kore nebo

   // ekhane home page er jonno amder hive er instance/Box create korte hobe, erpor kaj UI er vitor mane Body er ListView er vitor
   final Box box1 = Hive.box("notes2222");   // main file e 'notes2222' name dichilam sekhan theke eta ekhane use kortechi
   // amra jani Box er vitor key ebong value pair akare thake jeta niche dekhte pabo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           // jehutu sob class file e static deya ache tai object create korar proyojon hoy nai
           backgroundColor: AllColors.brownColor,                 // class theke object creat kora chara color payechi
           title: Text("NotePad", style: AllStyles.titleStyle.copyWith(color: AllColors.whiteColor)),  // class theke object creat kora chara style payechi
           // titleStyle e color black chilo, ".copyWith(color: AllColors.whiteColor)" dara ei color ta ager color er uor override korchi
         ),

      // ekhon body er vitor kivabe ListView banano jay seta dekhbo
      // tachara dekhbo kivabe update/edit, delete kora jay,
      // ar kivabe details ta onno page e show kora jay r sekhan theke kivabe copy share kora jay seta dekhbo

      body: GetBuilder<HomeController>(builder: (_){
           return box1.keys.isEmpty? // etao hive er moddhe thakte hobe, hove er moddhe kno item na thakle "Empty Note!!!" dekhabe
           //or
           //return box1.keys.length==0?
           Center(child: Text("Empty Note!!!")) :

           ValueListenableBuilder(     // Hive er jonno ValueListenableBuilder diye ListView.builder ke wrap korlam
             // ekhane amader 2 ta property use korte hobe
             valueListenable: box1.listenable(),   // upore box1 create korechi
             // "ValueListenableBuilder" er kaj holo ei Box(means box1) er vitor kno value change hobe tar sathe sathe-
             // -ei("ValueListenableBuilder") widget ta call hobe r er vitor je property/widget gulo ache tara updated value gulo use korbe
             builder: (context, box1, child) {        // ekhane builder er vitor 3 ta paramenter asbe, tar moddhe 1st and 3rd mone rakhte hobe bakita uporer box name

               return ListView.builder(     // body er vitor ListView Create hocche
                  //itemCount: homeController.notes.length,      // add korar sathe sathe automatic length baray nibe,
               // eta(uporer line ta) List theke use kortechilam jeta "L17_note_models.dart" e ache, e sekhaner "List<NoteModel> notes = [];" eta theke use kortechilam-
               // kintu ekhon hive use korar por oikhan theke use korte hobe na,
               // ekhon hive er je Database ache amra sekhan thek use korbo
               itemCount: box1.keys.length,      // amra jani Box er vitor key ebong value pair akare thake, mane je koyta key ache same poriman value ache
               //itemCount: box1.values.length,  // keys ba values jekno ekta use kore korte pari tobe keys use kora better
               // er mane jotogulo item ukto Box(ekhane box1) e ache ta use kortechi itemCount: e

               itemBuilder: (context,index){
                 // age sobgulo homeController theke use kortechilam ebar hive theke mane oi Box(box1) theke use korte hobe
                 final NoteModel notexxx = box1.getAt(index);  // er mane amra box1 theke index dhore dhore amader item gulo niye astechi
                 return ListTile(
                  // title: Text(homeController.notes[index].title),           // index autometicly niye nibe
                     title: Text(notexxx.title),
                  // subtitle: Text(homeController.notes[index].description),
                     subtitle: Text(notexxx.description),
                   trailing: SizedBox(
                     width: 60,            // SizedBox nile must be width dite hobe
                     child: Row(
                      children: [
                         InkWell(     // icon e press korar jonno Inkwell use korbo
                           onTap: ()=> _showUpdateAlert(context,index),       // nicher _showUpdateAlert() function onujayi ei (context,index) 2 ta pathate hobe
                            child: Icon(Icons.edit,color: AllColors.blackColor.withOpacity(0.7)),
                         ),
                         SizedBox(width: 10,),
                         InkWell(     // icon e press korar jonno Inkwell use korbo
                           onTap: ()=>homeController.deleteNote(index),     // deleteNote function "L17_home_controller.dart" e ache
                           child: Icon(Icons.delete,color: AllColors.redColor),
                         ),
                       ],
                     ),
                   ),
                   // jokhn amra kno ekta list e click korbo tokhon amra notun screen e jabo, sei kaj ta ekhane korbo ListTile er vitor korbo
                   // jehutu GetX use kortechi tai GetX er navigation system use korte hobe, seta Get.to(), ekhane argument soho pathate hobe must
                   // eta use korle amra ek page theke arek page e navigate korte parbo
                   // argument er jonno NoteDetailsScreen() er ei {super.key} argument pathanor dorkar nai jehutu GetX use korchi. chaile amra ei {super.key} argument o pathate parbo
                   // but GetX amader argument subidha dey alada kore, oitai amra ekhane use korbo
                   onTap: () {     // ei onTap diye eta amra just dhakka dicchi ar "L17_note_tails_screen_withGetsure_detector.dart" dara sei page r receive kortechi
                     Get.to(NoteDetailsScreen(), arguments: {    // Get.to() dara onno page e jaoyar navigate kori
                       //"title": homeController.notes[index].title,
                       "title": notexxx.title,
                       // "description": homeController.notes[index].description,
                       "description": notexxx.description,
                       // "date": homeController.notes[index].date
                       "date": notexxx.date
                     });
                   }// eta map akare jacche
                 );
               });
             }
           );
    }),

      floatingActionButton: FloatingActionButton(
          backgroundColor: AllColors.brownColor.withOpacity(1),
          child: const Icon(Icons.add, color: AllColors.whiteColor,),
          // floating button e click korle ekta Alert dialogue box open korte cai, ja niche function akare banai niyechi
          onPressed: (){
            _showAlert(context);      // niche ei function ti banai nichi AlertBox er jonno, eta ekta context ney BuildContext theke
          }),
      // floating button er location iccha korle change kora jay nicher moto kore
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }   // end of build function

  // build function er pore kno function create korte hobe
  // ekhane amra Alert Dialogue Box er jonno ekta function banabo

   _showAlert(BuildContext context){   // nicher showDialog er vitor 2 ta property ache, context r builder
                                       // amra ei Dialogue diye ki UI dekhate chai ta builder er maddhome dekhate hobe
    showDialog(context: context, builder: (_){
      return Center(   // AlertBox ke Center e show korar jonno eta use kortechi
        child: SingleChildScrollView(     // SingleChildScrollView use na kole puru screen jure AlertBox niye nibe, ejonno eta use korte hobe, jototuku jay proyojon thik tototuku niye nibe
          child: AlertDialog(
            content: Column(
              children: [    // notePad er vitor title arekta discription debo tachara date time diye debo jeta automatic niye nebe
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Titel"
                  ),
                ),
                // same vabe arekta Controller toiri korbo
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Discription"
                  ),
                ),
              ],
            ),
            // ebar 2 ta button nebo ekta save er jonno arekta cancle er jonno, sejonno actions:[] ekhanei nite hobe
            // save korle seta database e save hobe, sekhan theke Oitake amra read korte parbo. Ekhon sudhu UI er vitor ekta list toiri korbo sekhane items gulo add kobo
            actions: [
              TextButton(style: TextButton.styleFrom(backgroundColor: AllColors.redColor),
                  onPressed: (){Navigator.pop(context);}, child: Text('Cancle',style: TextStyle(color: AllColors.whiteColor),)),
              TextButton(style: TextButton.styleFrom(backgroundColor: AllColors.brownColor),
                  onPressed: () {
                    if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
                      // Snackbar এর মাধ্যমে "Please fill up the form" মেসেজ দেখানো
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill up the form'),
                          backgroundColor: Colors.red,  // SnackBar এর ব্যাকগ্রাউন্ড কালার
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                    else{
                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('dd MMM yyy').format(now);  // MM dile 1, 2, 3... evabe mas asbe, MMM dile Jan, Feb.... evabe asbe
                      homeController.addNote(NoteModel(titleController.text, descriptionController.text, formattedDate));
                }    // addNote "L17_home_controller.dart" e ache, NoteModel "L17_note_models.dart" e ache
                Navigator.pop(context);}, child: Text('Save',style: TextStyle(color: AllColors.whiteColor),)),
            ],
          ),
        ),
      );
    });
  }

  // arekta Alert Dialogue Box create korbo notes Edit/update korar jonno
  // jehutu 2 tar jonno same controller use kortechi tai etar vitor casper ache, mane Alert Box e bortomane ja lekhbo ta poroborti
  // kno Alert Box open ba edit korle sei same lekha tai thakbe

   _showUpdateAlert(BuildContext context, int index){  // ekhane context er sathe arekta jinish nebo seta holo 'int index', Edit er jonno ei 2 ta bisoy amra pathabo
     showDialog(context: context, builder: (_){
       return Center(   // AlertBox ke Center e show korar jonno eta use kortechi
         child: SingleChildScrollView(     // SingleChildScrollView use na kole puru screen jure AlertBox niye nibe, ejonno eta use korte hobe, jototuku jay proyojon thik tototuku niye nibe
           child: AlertDialog(
             content: Column(
               children: [    // notePad er vitor title arekta discription debo tachara date time diye debo jeta automatic niye nebe
                 TextField(
                   controller: titleController,
                   decoration: InputDecoration(
                       hintText: "Titel"
                   ),
                 ),
                 // same vabe arekta Controller toiri korbo
                 TextField(
                   controller: descriptionController,
                   decoration: InputDecoration(
                       hintText: "Discription"
                   ),
                 ),
               ],
             ),
             // ebar 2 ta button nebo ekta save er jonno arekta cancle er jonno, sejonno actions:[] ekhanei nite hobe
             // save korle seta database e save hobe, sekhan theke Oitake amra read korte parbo. Ekhon sudhu UI er vitor ekta list toiri korbo sekhane items gulo add kobo
             actions: [
               TextButton(style: TextButton.styleFrom(backgroundColor: AllColors.redColor),
                   onPressed: (){Navigator.pop(context);}, child: Text('Cancle',style: TextStyle(color: AllColors.whiteColor),)),
               TextButton(style: TextButton.styleFrom(backgroundColor: AllColors.brownColor),
                   onPressed: () {
                     if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
                       // Snackbar এর মাধ্যমে "Please fill up the form" মেসেজ দেখানো
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text('Please fill up the form'),
                           backgroundColor: Colors.red,  // SnackBar এর ব্যাকগ্রাউন্ড কালার
                           duration: Duration(seconds: 1),
                         ),
                       );
                     }
                     else{
                       DateTime now = DateTime.now();
                       String formattedDate = DateFormat('dd MMM yyy').format(now);  // MM dile 1, 2, 3... evabe mas asbe, MMM dile January, Febriary.... evabe asbe
                       homeController.updateNote(NoteModel(titleController.text, descriptionController.text,
                           formattedDate), index);    // updateNote 2 ta parameter receive kore, ekta NoteModel arekta index
                           // DateTime.now ke formating korte hobe nahole Date time dekha jabe na
                           // ejonno uporer moto 'formattedDate' use korte hobe ja "intl: ^0.20.1" ei package er under e ache
                     }
                     // addNote "L17_home_controller.dart" e ache, NoteModel "L17_note_models.dart" e ache
                     Navigator.pop(context);}, child: Text('Update',style: TextStyle(color: AllColors.whiteColor),)),
             ],
           ),
         ),
       );
     });
   }
}

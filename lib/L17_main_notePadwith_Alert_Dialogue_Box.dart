// Ekhane state management hisebe GetX use korbo
// Ebong local database hisebe Hive use korbo
// jegulo amader constant value ta onno file e banay nebo jemon "L17_all_colors.dart"
// ekadhik controller/services/UI ache ja controllers,services,UI directory er vitor ache
// services directory ekhon apatoto lagbe na, jokhon API er kaj korto tokhon eta use korbo

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'ui/L17_homeScreen_with_Alert_Dialogue_Box.dart';
import 'models/L17_note_models.dart';


void main()async {                  // hive use korar jonno ei main function take asynchronous(async) kore debo, erpor niche line
  WidgetsFlutterBinding.ensureInitialized();  // er por hive take initialize korbo
  await Hive.initFlutter();        // then amader ekta adapter ke register korte hobe niche line er moto
  Hive.registerAdapter(NoteModelAdapter());        // () er vitor adaptar name thakbe jeta L17_note_models.g.dart e ache, then ekta box create korte hobe
  await Hive.openBox("notes2222"); // () er vitor box name ache, jeta kekno kichu hote pare
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(        // GetX use korle GetMaterialApp eta must nite hobe
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


// L17_main_notePadwith_Alert_Dialogue_Box.dart
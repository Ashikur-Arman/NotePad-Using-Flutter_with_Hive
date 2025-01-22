// Hive niye kaj korle ei note_model e kichu kaj korte hobe seta holo, ekhane amra jokhon -
// -hive niye kaj kori tokhon Binary form e data store hoy, so ei model er akta Adapter toiri-
// -korte hobe, jar kotha amra main file e bolchilam

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// arekta kaj korte hobe seta holo, part er vitor '' e er file er nam dite hobe. .dart er age .g use korte hobe
part 'L17_note_models.g.dart';    // .g means generrator
// er jonno "flutter packages pub run build_runner build" eta use korle automatic models folder er vitor-
// -ei file er sathe 'L17_note_models.g.dart' etao create hoye jabe

@HiveType(typeId: 0)   // jehutu ekhane ekta marto model(NoteModel) ache tai 0, ekadhik thakle array er index er moto number hoto

class NoteModel{
  // ei model e amader 3 ta property ache(title, description, date) so protita property ke alada vabe bolte hobe @Hivefild(_)
  @HiveField(0)
  String title = "";
  @HiveField(1)
  String description = "";
  @HiveField(2)
  String date = "";

  NoteModel(String title, String description, String date){
      this.title = title;
      this.description = description;
      this.date = date;
  }
}
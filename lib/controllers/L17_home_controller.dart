import '../models/L17_note_models.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController{
  // ekhane ekta list toiri korbo, tar age list er jonno arekta bisoy use korte hobe seta ekta model class ja "L17_note_nodels.dart" file e ache
  // List<NoteModel> notes = [];     // er vitor 3 type(title, description, date) er data ese galo ja "L17_note_nodels.dart" e nichilam

  // "L17_homeScreen_with_Alert_Dialogue_Box.dart" er note ta ekhane add korte hobe, mane uporer moto same vabe ekta instance create korte hobe hyve er jonno
  final Box box1 = Hive.box("notes2222");

  // ei list er vitor amader item gulo add korbo, tar jonno ekta function toiri kora lagbe
  // function tar kaj hobe sudhumatro note guloke ukto list e add kora
  addNote(NoteModel note10){      // এখানে note10 একটি প্যারামিটার যা ফাংশনে ব্যবহারকারী কাস্টম ভাবে সংজ্ঞায়িত, just like normal function parameter
    //notes.add(note10);            // uporer list e Notes add hote thakbe
    // eta use kora mane uporer List er moddhe add use hocche, but amader hive er vitor use korte hobe mane Box(box1) er vitor
    box1.add(note10);
    update();
  }

  // Update ba edit korar jonno function
  updateNote(NoteModel note11, int index){ // index dhore amra update korbo
    // notes[index] = note11;              // এখানে note একটি প্যারামিটার যা ফাংশনে ব্যবহারকারী কাস্টম ভাবে সংজ্ঞায়িত, just like normal function parameter
    box1.putAt(index, note11);             // hive er jonno
    update();
  }

  // Note delete korar jonno ekhane arekta function use korte hobe
  deleteNote(int index){
    //notes.removeAt(index);
    box1.deleteAt(index);
    update();
  }
}
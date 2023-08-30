import 'package:hive_flutter/hive_flutter.dart';
import 'package:stulast/database/db_model/db_model.dart';

opendatabase() async {
  final newdb = await Hive.openBox<StudenNewtModel>("student_db");
  List<StudenNewtModel> newList = [];
 
  newList.addAll(newdb.values.where((element) => element.age > 5));
  print(newList.length);

  newList.forEach((element) {
    print(element.name);
     });
}
 //List list1 = [];
  //newList.addAll(newdb.values);
  
  // var result = newdb.values.where((element) => element.age > 5);
  //var result = newdb.values.map((e) => e.age > 5).toList();
  
    // print(list1);
 

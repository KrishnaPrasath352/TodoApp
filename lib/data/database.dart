import 'package:hive_flutter/hive_flutter.dart';

class tododatabase
{
  List l=[];
  final _mybox=Hive.box("mybox");

  void createInitialData()
  {
    l=[["BREAKFAST",false],
       ["LUNCH",false],
       ["DINNER",false]];
  }
  void loaddata()
  {
    l=_mybox.get("TODOLIST");
  }
  void updatedata()
  {
    _mybox.put("TODOLIST",l);
  }
}
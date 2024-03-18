import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/Dialogue_box.dart';
import 'package:todoapp/util/todo_page.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  final _mybox=Hive.box("mybox");
  tododatabase dp=tododatabase();
  @override
  void initState() {
    // TODO: implement initState
      if(_mybox.get("TODOLIST")==null)
      {
        dp.createInitialData();
      }
      else
        {
          dp.loaddata();
        }
    super.initState();
  }
  final _controller=TextEditingController();

  void onclick(bool? value,int index)
  {
    setState(() {
      dp.l[index][1]=!dp.l[index][1];
    });
    dp.updatedata();
  }
  void savenewtask()
  {
    setState(() {
      dp.l.add([_controller.text,false]);
      _controller.clear();
    });
    dp.updatedata();
    Navigator.of(context).pop();
  }
  void delete_task(int index)
  {
    setState(() {
      dp.l.removeAt(index);
    });
    dp.updatedata();
  }
  void createnewtask()
  {
    showDialog(
        context: context,
        builder:(context){
          return dialogueBox(
            controller: _controller,
            onSave: savenewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text("TO DO",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        itemCount: dp.l.length,
        itemBuilder:(context, index) {
          return TodoPage(
              taskName: dp.l[index][0],
              taskDone: dp.l[index][1],
              onChanged:(value) => onclick(value,index),
              deletetask: (context) => delete_task(index),
          );
        },
      ),
    );
  }
}


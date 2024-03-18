import 'package:flutter/material.dart';
import 'package:todoapp/util/button_file.dart';

class dialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  dialogueBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[200],
      content: Container(
        height: 120,
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.white,style: BorderStyle.solid)),
                    hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.white),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      myButton(name: "SAVE", onPressed: onSave,),
                      const SizedBox(width: 16),
                      myButton(name: "CANCEL", onPressed: onCancel,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

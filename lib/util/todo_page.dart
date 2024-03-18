import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoPage extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetask;
  TodoPage({
    super.key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
    required this.deletetask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletetask,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              Checkbox(value: taskDone, onChanged: onChanged,activeColor: Colors.cyan[200],),
              Text(taskName,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,fontWeight:FontWeight.bold,
              ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

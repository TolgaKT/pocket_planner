import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskAdder extends StatefulWidget {
  @override
  _TaskAdderState createState() => _TaskAdderState();
}

class _TaskAdderState extends State<TaskAdder> {
  FocusNode _focusNode;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.addListener(() {});
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              Text(
                'New Task',
                style: kSubTitleStyle.copyWith(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    TaskController.createTask(
                        Task(taskName: _textEditingController.value.text),
                        context);
                    Navigator.pop(context);
                  },
                  child: Text('Create')),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          TextFormField(
            controller: _textEditingController,
            focusNode: _focusNode,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

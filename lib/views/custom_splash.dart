import 'package:flutter/material.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/controllers/project_controller.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/views/home_view.dart';

class CustomSplash extends StatefulWidget {
  @override
  _CustomSplashState createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> {
  Future<void> getData() async {
    await LabelController.getLabels(context);
    await TaskController.getTasks(context);
    await ProjectController.getProjects(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().whenComplete(() {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

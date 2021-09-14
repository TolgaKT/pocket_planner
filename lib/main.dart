import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:pocket_planner/views/custom_splash.dart';
import 'package:provider/provider.dart';

import 'models/class_data/project_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProjectData>(
          create: (context) => ProjectData(),
        ),
        ChangeNotifierProvider<TaskData>(create: (context) => TaskData()),
        ChangeNotifierProvider<LabelData>(
          create: (context) => LabelData(),
        ),
      ],
      child: MaterialApp(
        home: CustomSplash(),
      ),
    );
  }
}

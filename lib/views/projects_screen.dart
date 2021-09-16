import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/project_list.dart';
import 'package:pocket_planner/components/project_creator.dart';

import '../constants.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15.0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '''Ongoing Projects''',
                    style:
                        kTitleStyle.copyWith(color: Colors.black, fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return ProjectCreator();
                            });
                      },
                      child: Text(
                        '+ Add Project',
                        style: kSubTitleStyle.copyWith(
                            fontSize: 16, color: Colors.black),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(child: ProjectList())
            ],
          ),
        ),
      ),
    );
  }
}

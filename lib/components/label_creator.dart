import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

import 'custom_text_field.dart';

class LabelCreator extends StatefulWidget {
  @override
  _LabelCreatorState createState() => _LabelCreatorState();
}

class _LabelCreatorState extends State<LabelCreator> {
  FocusNode _nameNode;
  String selectedColor = 'kMainPink';
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {});
    _nameNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _nameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.times,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: kColorMap['kGrey'].withOpacity(.4),
            height: 1.0,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kColorMap['kMainWhite'],
        title: Text(
          'Create Label',
          style: kTitleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Label Name',
              style: kSubTitleStyle.copyWith(fontSize: 15, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(node: _nameNode, controller: _nameController),
            SizedBox(
              height: 35,
            ),
            Text(
              'Color',
              style: kSubTitleStyle.copyWith(fontSize: 15, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kColorMap['kGrey'].withOpacity(.5)),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 2),
                      crossAxisCount: 5,
                      crossAxisSpacing: 15),
                  itemCount: kLabelMap.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = kLabelMap.keys.toList()[index];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: selectedColor ==
                                    kLabelMap.keys.toList()[index]
                                ? Border.all(color: Colors.black, width: 3)
                                : Border.all(
                                    color: kLabelMap.values.toList()[index]),
                            shape: BoxShape.circle,
                            color: kLabelMap.values.toList()[index]),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: RoundedButton(
                buttonColor: kColorMap['kMainPurple'],
                onPressed: () {
                  LabelController.createLabel(
                      Label(
                          labelName: _nameController.text,
                          labelColor: selectedColor),
                      context);
                  Navigator.pop(context);
                },
                buttonChild: Text('Create'),
                height: 50,
                width: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

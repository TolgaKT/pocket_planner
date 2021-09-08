import 'package:flutter/material.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class LabelCreator extends StatefulWidget {
  @override
  _LabelCreatorState createState() => _LabelCreatorState();
}

class _LabelCreatorState extends State<LabelCreator> {
  FocusNode _nameNode;
  Color selectedColor = kLabelMap['kMainPink'];
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
      body: Container(
        decoration: BoxDecoration(color: kColorMap['kMainWhite']),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LABEL NAME',
                style:
                    kSubTitleStyle.copyWith(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kColorMap['kGrey']),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kColorMap['kGrey']),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kColorMap['kGrey']),
                  ),
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                focusNode: _nameNode,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'COLOR',
                style: kSubTitleStyle.copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kColorMap['kGrey']),
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
                            selectedColor = kLabelMap.values.toList()[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: selectedColor ==
                                      kLabelMap.values.toList()[index]
                                  ? Border.all(color: Colors.black, width: 3)
                                  : Border.all(
                                      color: kLabelMap.values.toList()[index]),
                              shape: BoxShape.circle,
                              color: kLabelMap.values.toList()[index]),
                        ),
                      );
                    }),
              )),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    buttonColor: Colors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonChild: Text('Cancel'),
                    height: 50,
                    width: 140,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  RoundedButton(
                    buttonColor: Colors.blueAccent,
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
                    width: 140,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

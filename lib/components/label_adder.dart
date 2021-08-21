import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

import '../constants.dart';

class LabelAdder extends StatefulWidget {
  @override
  _LabelAdderState createState() => _LabelAdderState();
}

class _LabelAdderState extends State<LabelAdder> {
  FocusNode _focusNode;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController.addListener(() {});
    _focusNode = FocusNode();
  }

  // create some values
  Color pickerColor = Colors.white;
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
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
                'New Label',
                style: kSubTitleStyle.copyWith(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    LabelController.createLabel(
                        Label(
                            labelColor: pickerColor,
                            labelName: _textEditingController.text),
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
          MaterialColorPicker(
              allowShades: false,
              onColorChange: (Color color) {
                // Handle color changes
              },
              onMainColorChange: (ColorSwatch color) {
                // Handle main color changes
              },
              selectedColor: Colors.red)
        ],
      ),
    );
  }
}

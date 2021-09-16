import 'package:pocket_planner/db/database.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class LabelDB {
  static Future<Label> createLabel(Label label) async {
    final db = await MainDatabase.instance.database;
    final id = await db.insert('labels', label.toJson());
    return Label(
        labelName: label.labelName, labelColor: label.labelColor, labelId: id);
  }

  static Future<void> deleteLabel(Label label) async {
    final db = await MainDatabase.instance.database;
    await db.delete('labels', where: 'labelId = ?', whereArgs: [label.labelId]);
  }

  static Future<List<Label>> getAllLabels() async {
    final db = await MainDatabase.instance.database;

    final result = await db.query('labels');
    if (result.isNotEmpty) {
      return result.map((e) => Label.fromDB(e)).toList();
    }
    return [];
  }
}

import 'package:pocket_planner/db/database.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

class ProjectDB {
  static Future<Project> createProject(Project project) async {
    final db = await MainDatabase.instance.database;
    final id = await db.insert('projects', project.toJson());
    return Project(
        projectId: id,
        projectName: project.projectName,
        labelId: project.labelId,
        taskIds: project.taskIds);
  }

  static Future<void> deleteProject(Project project) async {
    final db = await MainDatabase.instance.database;
    await db.delete('projects',
        where: 'projectId = ?', whereArgs: [project.projectId]);
  }

  static Future<void> addTask(Project project, int taskId) async {
    final db = await MainDatabase.instance.database;
    List<int> taskList = project.taskIds;
    taskList.add(taskId);
    String tasks = taskList.join(',');
    await db.rawUpdate('''
    UPDATE projects SET taskIds = $tasks WHERE projectId = ${project.projectId}
    
    ''');
  }

  static Future<void> deleteTask(Project project, int taskId) async {
    final db = await MainDatabase.instance.database;
    List<int> taskList = project.taskIds;
    taskList.remove(taskId);
    String tasks = taskList.join(',');
    await db.rawUpdate('''
    UPDATE projects SET taskIds = $tasks WHERE projectId = ${project.projectId}
   
    ''');
  }

  static Future<List<Project>> getAllProjects() async {
    final db = await MainDatabase.instance.database;

    final result = await db.query('projects');
    if (result.isNotEmpty) {
      return result.map((e) => Project.fromDB(e)).toList();
    }
    return [];
  }
}

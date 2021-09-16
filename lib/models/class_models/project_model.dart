class Project {
  List<int> taskIds;
  String projectName;
  int labelId;
  int projectId;

  Project(
      {this.projectName,
      this.taskIds = const [],
      this.labelId,
      this.projectId});

  factory Project.fromDB(Map<String, dynamic> json) {
    return Project(
        projectName: json['projectName'],
        projectId: json['projectId'],
        labelId: json['labelId'],
        taskIds: json['taskIds'].split(',').map((e) => int.parse(e)).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'labelId': labelId,
      'projectName': projectName,
      'taskIds': taskIds.join(',')
    };
  }
}

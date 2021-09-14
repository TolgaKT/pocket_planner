class Label {
  String labelName;
  String labelColor;
  int labelId;

  Label({this.labelColor, this.labelName, this.labelId});

  factory Label.fromDB(Map<String, dynamic> json) {
    return Label(
        labelId: json['labelId'],
        labelColor: json['labelColor'],
        labelName: json['labelName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'labelColor': labelColor,
      'labelName': labelName,
      'labelId': labelId
    };
  }
}

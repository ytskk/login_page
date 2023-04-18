// {
//                 "title": "cupiditate vitae fugiat sapiente animi illum pariatur harum facere suscipit",
//                 "status": 0,
//                 "createdAt": "2023-03-30T23:43:24.487+03:00",
//                 "value": 0
//             },

class OperationItemModel {
  const OperationItemModel({
    required this.description,
    required this.date,
    required this.value,
  });

  final String description;
  final String date;

  /// Value of adding, subtracting points.
  final int value;

  factory OperationItemModel.fromJson(Map<String, dynamic> json) {
    return OperationItemModel(
      description: json["description"],
      date: json["date"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "date": date,
        "value": value,
      };

  @override
  String toString() {
    return 'OperationItemModel(description: $description, date: $date, value: $value)';
  }
}

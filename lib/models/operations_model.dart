import 'package:training_and_testing/models/operation_item_model.dart';

class OperationsModel {
  const OperationsModel({
    required this.totalOperations,
    required this.operations,
  });

  // !!!
  factory OperationsModel.fromJson(Map<String, dynamic> json) {
    return OperationsModel(
      totalOperations: json['totalOperations'] as int,
      operations: List<OperationItemModel>.from(
        (json['items'] as List<dynamic>).map(
          (item) => OperationItemModel.fromJson(
            item as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  final int totalOperations;
  final List<OperationItemModel> operations;

  Map<String, dynamic> toJson() {
    return {
      'totalOperations': totalOperations,
      'items': operations.map((operation) => operation.toJson()),
    };
  }

  @override
  String toString() {
    return 'OperationsModel(totalOperations: $totalOperations, operations: $operations)';
  }
}

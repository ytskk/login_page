import 'operation_item_model.dart';

class OperationsModel {
  const OperationsModel({
    required this.totalOperations,
    required this.operations,
  });

  final int totalOperations;
  final List<OperationItemModel> operations;

  factory OperationsModel.fromJson(Map<String, dynamic> json) {
    return OperationsModel(
      totalOperations: json['totalOperations'],
      operations: List<OperationItemModel>.from(
        json['items'].map(
          (operation) => OperationItemModel.fromJson(operation),
        ),
      ),
    );
  }

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dynamic_form_controller.dart';
import 'input_field_data_model.dart';

class DynamicFormPage extends StatelessWidget {
  final List<InputFieldData> inputDataList = [
    InputFieldData(id: 'field 1', label: 'field 1'),
    InputFieldData(id: 'field 2', label: 'field 2'),
    InputFieldData(id: 'field 3', label: 'field 3'),
    InputFieldData(id: 'field 4', label: 'field 4'),
  ];
  final DynamicFormController controller = Get.put(DynamicFormController());

  DynamicFormPage({Key? key}) : super(key: key);

  void _handleSubmit() {
    print(controller.values.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test form')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: inputDataList.length + 1,
          itemBuilder: (context, index) {
            if (index == inputDataList.length) {
              return ElevatedButton(
                onPressed: _handleSubmit,
                child: const Text('Send'),
              );
            }

            final fieldData = inputDataList[index];
            return TextField(
              onChanged: (value) => controller.updateValue(fieldData.id, value),
              decoration: InputDecoration(
                labelText: fieldData.label,
              ),
            );
          },
        ),
      ),
    );
  }
}
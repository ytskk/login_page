import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormsBuilder extends StatelessWidget {
  FormsBuilder({super.key}) : _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _formKey;

  List<Widget> _parseJsonMap(dynamic jsonMap) {
    final List<Widget> parsedWidgets = [];
    if (jsonMap is List) {
      for (final item in jsonMap) {
        parsedWidgets.addAll(_parseJsonMap(item));
      }
    } else if (jsonMap is Map) {
      parsedWidgets.add(
        _matchingStringToWidget(
          jsonMap['type'] as String,
          jsonMap['properties'],
        ),
      );
    } else {
      throw Exception('Invalid map');
    }
    return parsedWidgets;
  }

  Widget _matchingStringToWidget(String type, dynamic properties) {
    switch (type) {
      case 'field':
        return FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: properties['name'] as String,
          decoration: InputDecoration(labelText: properties['name'] as String),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
        );
      case 'submitButton':
        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.saveAndValidate()) {
              final formData = _formKey.currentState?.value;
              print(formData);
            }
          },
          child: const Text('Save'),
        );

      case "flexible":
        return Flexible(
            flex: properties['flex'] as int,
            child: _parseJsonMap(properties['child'])[0]);
      case 'text':
        return Text(properties['text'] as String);
      case 'container':
        return Container(
          width: properties['width']?.toDouble() as double,
          height: properties['height']?.toDouble() as double,
          child: _parseJsonMap(properties['child'])[0],
        );
      case 'row':
        return Row(
          children: _parseJsonMap(properties['children']),
        );
      case 'column':
        return Column(
          children: _parseJsonMap(properties['children']),
        );
      default:
        throw Exception('Unsupported widget type: $type');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: _parseJsonMap(_TestMap.testMap())[0],
      ),
    );
  }
}

abstract class _TestMap {
  static Map<String, dynamic> testMap() {
    return {
      "type": "column",
      "properties": {
        "children": [
          {
            "type": "field",
            "properties": {"name": "name"},
          },
          {
            "type": "field",
            "properties": {"name": "surname"},
          },
          {
            "type": "field",
            "properties": {"name": "email"},
          },
          {
            "type": "row",
            "properties": {
              "children": [
                {
                  "type": "flexible",
                  "properties": {
                    "flex": 1,
                    "child": {
                      "type": "field",
                      "properties": {"name": "code"},
                    }
                  },
                },
                {
                  "type": "flexible",
                  "properties": {
                    "flex": 3,
                    "child": {
                      "type": "field",
                      "properties": {"name": "number"},
                    }
                  },
                },
              ]
            },
          },
          {"type": "submitButton"}
        ]
      },
    };
  }
}

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormsBuilderRx extends StatelessWidget {
  FormsBuilderRx({super.key}) : _form = FormGroup({});
  final FormGroup _form;

  List<Widget> _parseJsonMap(dynamic jsonMap, FormGroup formGr) {
    final List<Widget> parsedWidgets = [];
    FormGroup currentFormGroup = formGr;
    if (jsonMap is List) {
      for (final item in jsonMap) {
        parsedWidgets.addAll(_parseJsonMap(item, formGr));
      }
    } else if (jsonMap is Map) {
      parsedWidgets.add(_matchingStringToWidget(
          jsonMap['type'], jsonMap['properties'], currentFormGroup));
    } else {
      throw Exception('Invalid map');
    }
    return parsedWidgets;
  }

  Widget _matchingStringToWidget(
      String type, dynamic properties, FormGroup formGr) {
    switch (type) {
      case 'field':
        formGr.addAll({
          properties['name']:
              FormControl<String>(validators: [Validators.required])
        });
        return ReactiveTextField<String>(
          formControlName: properties['name'],
          decoration: InputDecoration(
            labelText: properties['name'],
            border: OutlineInputBorder(),
          ),
        );
      case 'form':
        formGr.addAll({properties['name']: FormGroup({})});
        formGr = formGr.control(properties['name']) as FormGroup;
        return ReactiveForm(
          formGroup: formGr,
          child: _parseJsonMap(properties['child'], formGr)[0],
        );
      case 'submitButton':
        return ElevatedButton(
          onPressed: () {
            if (_form.valid) {
              print(_form.value);
            } else {
              _form.markAllAsTouched();
            }
          },
          child: const Text('Submit'),
        );

      case "flexible":
        return Flexible(
            flex: properties['flex'],
            child: _parseJsonMap(properties['child'], formGr)[0]);
      case 'text':
        return Text(properties['text']);
      case 'container':
        return Container(
          width: properties['width']?.toDouble(),
          height: properties['height']?.toDouble(),
          color: Color(properties['color']),
          child: _parseJsonMap(properties['child'], formGr)[0],
        );
      case 'row':
        return Row(
          children: _parseJsonMap(properties['children'], formGr),
        );
      case 'column':
        return Column(
          children: _parseJsonMap(properties['children'], formGr),
        );
      default:
        throw Exception('Unsupported widget type: $type');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ReactiveForm(
        formGroup: _form,
        child: _parseJsonMap(_TestMap.testMap(), _form)[0],
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
            "type": "form",
            "properties": {
              "name": "mobilePhone",
              "child": {
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
            },
          },
          {"type": "submitButton"}
        ]
      },
    };
  }
}

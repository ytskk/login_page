import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormsBuilderRx extends StatelessWidget {
  FormsBuilderRx({super.key}) : _form = FormGroup({});
  final FormGroup _form;

  List<Widget> _parseJsonMap(dynamic jsonMap, FormGroup formGr) {
    final parsedWidgets = <Widget>[];
    final currentFormGroup = formGr;
    if (jsonMap is List) {
      for (final item in jsonMap) {
        parsedWidgets.addAll(_parseJsonMap(item, formGr));
      }
    } else if (jsonMap is Map) {
      parsedWidgets.add(
        _matchingStringToWidget(
          jsonMap['type'] as String,
          jsonMap['properties'],
          currentFormGroup,
        ),
      );
    } else {
      throw Exception('Invalid map');
    }
    return parsedWidgets;
  }

  Widget _matchingStringToWidget(
    String type,
    dynamic properties,
    FormGroup formGr,
  ) {
    switch (type) {
      case 'field':
        formGr.addAll({
          properties['name'] as String:
              FormControl<String>(validators: [Validators.required])
        });
        return ReactiveTextField<String>(
          formControlName: properties['name'] as String,
          decoration: InputDecoration(
            labelText: properties['name'] as String,
            border: const OutlineInputBorder(),
          ),
        );
      case 'form':
        formGr.addAll({properties['name'] as String: FormGroup({})});
        formGr = formGr.control(properties['name'] as String) as FormGroup;
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

      case 'flexible':
        return Flexible(
            flex: properties['flex'] as int,
            child: _parseJsonMap(properties['child'], formGr)[0],);
      case 'text':
        return Text(properties['text'] as String);
      case 'container':
        return SizedBox(
          width: properties['width']?.toDouble() as double,
          height: properties['height']?.toDouble() as double,
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
      'type': 'column',
      'properties': {
        'children': [
          {
            'type': 'field',
            'properties': {'name': 'name'},
          },
          {
            'type': 'field',
            'properties': {'name': 'surname'},
          },
          {
            'type': 'field',
            'properties': {'name': 'email'},
          },
          {
            'type': 'form',
            'properties': {
              'name': 'mobilePhone',
              'child': {
                'type': 'row',
                'properties': {
                  'children': [
                    {
                      'type': 'flexible',
                      'properties': {
                        'flex': 1,
                        'child': {
                          'type': 'field',
                          'properties': {'name': 'code'},
                        }
                      },
                    },
                    {
                      'type': 'flexible',
                      'properties': {
                        'flex': 3,
                        'child': {
                          'type': 'field',
                          'properties': {'name': 'number'},
                        }
                      },
                    },
                  ]
                },
              },
            },
          },
          {'type': 'submitButton'}
        ]
      },
    };
  }
}

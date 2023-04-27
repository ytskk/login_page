import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SimpleForm extends StatelessWidget{
  
    SimpleForm({super.key}): _formKey= GlobalKey<FormBuilderState>();

  final GlobalKey<FormBuilderState> _formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(labelText: 'Name'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          FormBuilderTextField(
            name: 'surname',
            decoration: const InputDecoration(labelText: 'Surname'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          FormBuilderTextField(
            name: 'email',
            decoration: const InputDecoration(labelText: 'E-mail'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          Row(
            children: [
              Flexible(
                child: FormBuilderTextField(
                  name: 'phoneCountryCode',
                  decoration: const InputDecoration(labelText: 'Country Code'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'phoneNumber',
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  // inputFormatters: [PhoneInputFormatter()],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                final formData = _formKey.currentState?.value;
                // final mobilePhone = {
                //   'code': formData['countryCode'],
                //   'number': formData['phoneNumber'],
                // };
                // formData.remove('countryCode');
                // formData.remove('phoneNumber');
                // formData['mobilePhone'] = mobilePhone;
                print(formData);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }


}
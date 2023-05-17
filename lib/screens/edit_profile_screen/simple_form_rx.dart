import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SimpleFormRx extends StatelessWidget {
  SimpleFormRx({super.key})
      : form = FormGroup({
          'name': FormControl<String>(validators: [Validators.required]),
          'surname': FormControl<String>(validators: [Validators.required]),
          'email': FormControl<String>(
              validators: [Validators.required, Validators.email],),
          'mobilePhone': FormGroup({
            'code': FormControl<String>(validators: [Validators.required]),
            'number': FormControl<String>(validators: [Validators.required])
          }),
        });

  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          ReactiveTextField<String>(
            formControlName: 'name',
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          ReactiveTextField<String>(
            formControlName: 'surname',
            decoration: const InputDecoration(
              labelText: 'Surname',
              border: OutlineInputBorder(),
            ),
          ),
          ReactiveTextField<String>(
            formControlName: 'email',
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(),
            ),
          ),
          ReactiveForm(
              formGroup: form.control('mobilePhone') as FormGroup,
              child: Column(
                children: [
                  ReactiveTextField<String>(
                    formControlName: 'code',
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'number',
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),),
          ElevatedButton(
            onPressed: () {
              if (form.valid) {
                print(form.value);
              } else {
                form.markAllAsTouched();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

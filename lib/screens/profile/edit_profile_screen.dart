import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/profile/widgets/log_out_button.dart';
import 'package:training_and_testing/screens/profile/widgets/trailer_button_template.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/segmented_button/segmented_button.dart';
import 'package:training_and_testing/widgets/widgets.dart';

import '../../widgets/custom_fields/description_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Widget buildAdressesBlock() {
      final header = BlockHeader(
        title: 'My adresses',
        label: 1,
        trailing: TrailerButtonTemplate.add(
          title: 'New address',
        ),
      );

      final body = SegmentedButtonWidget(
        backgroundColor: Theme.of(context).colorScheme.grey70,
        itemBackgroundColor: Theme.of(context).colorScheme.grey90,
        indent: 1,
        children: const [
          SegmentedButtonItem.chevron(
            title: 'Home',
          ),
          SegmentedButtonItem.chevron(
            title: 'Work',
          ),
        ],
      );

      return BlockTemplate(
        header: header,
        body: body,
        padding: const EdgeInsets.symmetric(vertical: padding20),
      );
    }

    Widget buildNotificationsBlock() {
      const header = BlockHeader(title: 'Notifications');

      final body = SegmentedButtonWidget(
        backgroundColor: Theme.of(context).colorScheme.grey70,
        itemBackgroundColor: Theme.of(context).colorScheme.grey90,
        indent: 1,
        children: [
          SegmentedButtonItem.switcher(
            title: 'Push',
            value: true,
            onChanged: print,
          ),
          SegmentedButtonItem.switcher(
            title: 'SMS',
            value: true,
            onChanged: print,
          ),
          SegmentedButtonItem.switcher(
            title: 'E-mail',
            value: true,
            onChanged: print,
          ),
        ],
      );

      return BlockTemplate(
        header: header,
        body: body,
        padding: const EdgeInsets.symmetric(vertical: padding20),
      );
    }

    // test
    void showBottomSheet(BuildContext context) {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return const SizedBox(
            height: 100,
            width: double.infinity,
          );
        },
      );
    }

    final maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    //

    Widget buildForm() {
      final form = FormGroup({});
      return Column(
        children: [
          ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                BasicFormField(
                  controlName: 'Name',
                  form: form,
                ),
                BasicFormField(
                  controlName: 'Surname',
                  form: form,
                ),
                BasicFormField(
                  controlName: 'E-mail',
                  form: form,
                  disabled: true,
                  initialValue: 'test@test.com',
                ),
                ButtonFormField(
                  form: form,
                  controlName: 'Mobile phone',
                  buttonText: 'Confirm',
                  formatters: [maskFormatter],
                  initialValue: '+7 (000) 000-00-00',
                ),
                ActionFormField(
                  controlName: 'Country',
                  form: form,
                  onTap: () => showBottomSheet(context),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.h3,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        children: [
          buildForm(),
          buildAdressesBlock(),
          buildNotificationsBlock(),
          Padding(
            padding: const EdgeInsets.only(bottom: padding16, top: padding32),
            child: LogOutButtonWidget(
              text: 'Log out of your account',
              onPressed: () async => authController.signOut(),
            ),
          ),
        ],
      ),
    );
  }
}

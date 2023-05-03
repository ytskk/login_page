import 'package:flutter/material.dart';
import 'package:training_and_testing/screens/edit_profile_screen/form_builder.dart';
import 'package:training_and_testing/theme/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.black,
        title: const Text('Edit profile'),
      ),
      // body: FormsBuilderRx(),
      body: FormsBuilder(),
    );
  }
}

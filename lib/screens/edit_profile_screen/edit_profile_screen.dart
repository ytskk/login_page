import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_colors.dart';

import 'form_builder.dart';
import 'form_builder_rx.dart';

class EditProfileScreen extends StatelessWidget {


  EditProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.black,
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

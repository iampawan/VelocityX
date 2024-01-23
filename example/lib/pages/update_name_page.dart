import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vx_example/mutations/mutations.dart';

/// Update name page.
///
/// Contains a standard text form and a submit button.
class UpdateNamePage extends StatelessWidget {
  /// Create update name page.
  const UpdateNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: 'Update name'.text.make()),
      body: [
        /// Text form field
        TextFormField(
          key: const Key('update-name-form'),
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your name',
          ),
        ).px64(),

        /// Submit button
        ElevatedButton(
          key: const Key('update-name-submit'),
          onPressed: () {
            UpdateName(controller.text);
            Navigator.pop(context);
          },
          child: 'Submit'.text.make(),
        ).p12(),
      ].vStack(alignment: MainAxisAlignment.center),
    );
  }
}

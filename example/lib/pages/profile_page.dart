import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vx_example/mutations/mutations.dart';
import 'package:vx_example/pages/pages.dart';
import 'package:vx_example/stores/stores.dart';

/// Profile page.
class ProfilePage extends StatelessWidget {
  /// Create profile page.
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Profile page'.text.make()),
      body: [
        VxBuilder<BaseStore>(
          mutations: const {GetUser, UpdateName},
          builder: (context, store, status) {
            return 'current name: ${store.user.name}'
                .text
                .xl2
                .makeCentered()
                .py16();
          },
        ),
        ElevatedButton(
          key: const Key('update-name-button'),
          onPressed: () => context.nextPage(const UpdateNamePage()),
          child: 'Update name'.text.make(),
        ).p12(),
      ].vStack(alignment: MainAxisAlignment.center).centered(),
    );
  }
}

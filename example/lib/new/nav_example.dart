import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Nav1 extends StatefulWidget {
  @override
  _Nav1State createState() => _Nav1State();
}

class _Nav1State extends State<Nav1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Nav1".text.make()),
      body: [
        TextButton(
          onPressed: () {
            VxNavigator.of(context).pop();
          },
          child: "Pop Page".text.make(),
        ),
        TextButton(
          onPressed: () {
            VxNavigator.of(context).push(Uri(path: "/nav2"));
          },
          child: "Push to Nav2".text.make(),
        ),
        TextButton(
          onPressed: () {
            VxNavigator.of(context).replace(Uri(path: "/nav2"));
          },
          child: "Clear & Push Nav2".text.make(),
        ),
      ].vStack().centered(),
    );
  }
}

class Nav2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Nav2".text.make()),
      body: "Nav2".text.makeCentered(),
    );
  }
}

class Nav3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Nav3".text.make()),
      body: "Nav3".text.makeCentered(),
    );
  }
}

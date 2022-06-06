import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Nav1 extends StatefulWidget {
  const Nav1({Key? key}) : super(key: key);

  @override
  State<Nav1> createState() => _Nav1State();
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
        TextButton(
          onPressed: () async {
            final path =
                await VxNavigator.of(context).waitAndPush(Uri(path: "/nav3"));
            print("Returned $path");
          },
          child: "Wait & Push Nav3".text.make(),
        ),
        TextButton(
          onPressed: () {
            VxNavigator.of(context).returnAndPush(Uri(path: "/"));
          },
          child: "Return result".text.make(),
        ),
      ].vStack().centered(),
    );
  }
}

class Nav2 extends StatelessWidget {
  const Nav2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Nav2".text.make()),
      body: "Nav2".text.makeCentered(),
    );
  }
}

class Nav3 extends StatelessWidget {
  const Nav3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Nav3".text.make()),
      body: [
        "Nav3".text.makeCentered(),
        TextButton(
          onPressed: () {
            VxNavigator.of(context).popToRoot();
          },
          child: "Pop to root".text.make(),
        ),
        TextButton(
          onPressed: () {
            VxNavigator.of(context).returnAndPush(Uri(path: "/nav1"));
          },
          child: "Return result".text.make(),
        ),
      ].vStack(),
    );
  }
}

class Nav4 extends StatelessWidget {
  final String pathParam;
  final Map<String, List<String>> queryParams;

  const Nav4({
    Key? key,
    this.pathParam = '',
    this.queryParams = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: "Vx Navigation".text.make()),
      body: VStack(
        [
          VxTwoRow(
            left: 'Path Param: '.text.bold.make(),
            right: pathParam.text.make(),
          ),
          20.heightBox,
          VxTwoRow(
            left: 'Query Params: '.text.bold.make(),
            right: queryParams
                .map((k, v) => MapEntry(k, '$k=$v'))
                .values
                .map((x) => x.text.make())
                .toList()
                .vStack(),
          ),
        ],
      ).centered(),
    );
  }
}

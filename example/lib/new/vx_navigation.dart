import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VxNavigation extends StatelessWidget {
  final String pathParam;
  final Map<String, List<String>> queryParams;

  const VxNavigation({
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

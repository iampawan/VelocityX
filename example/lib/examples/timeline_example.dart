import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TimelineExample extends StatelessWidget {
  const TimelineExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxTimeline(
        animationDuration: 5.seconds,
        showTrailing: true,
        onItemTap: (value) {
          print(value.heading);
        },
        timelineList: List.generate(
          3,
          (index) => VxTimelineModel(
              id: index,
              heading: "Nov 01, 2020",
              description: "Hello Vx $index",
              actionUrl: ""),
        ).toList());
  }
}

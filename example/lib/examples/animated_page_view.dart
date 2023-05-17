import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimatedPageView extends StatefulWidget {
  const AnimatedPageView({super.key});

  @override
  AnimatedPageViewState createState() => AnimatedPageViewState();
}

class AnimatedPageViewState extends State<AnimatedPageView> {
  final List<double> _imgScaleMap = [0.8, 0.7, 1.0, 0.9, 1.2, 1.5];
  int _currentIndex = 0;

  List<String> parsePics() {
    return [
      "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1551721434-8b94ddff0e6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1541560052-3744e48ab80b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1559650656-5d1d361ad10e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
      "https://images.unsplash.com/photo-1512499617640-c74ae3a79d37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60",
    ];
  }

  double calculateImgScale(int index) {
    return _imgScaleMap[index];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> pics = parsePics();
    if (pics.isEmpty) {
      return Container();
    }

    final Widget child = VxAnimatedHeightView<PageView>(
      pageViewChild: PageView.builder(
        itemCount: pics.length,
        controller: PageController(),
        itemBuilder: (context, index) {
          final String imgUrl = pics.elementAt(index);
          final double w = context.screenWidth;
          final double h = w * calculateImgScale(index);
          return GestureDetector(
            onTap: () {
              Vx.log("tap img index is $index");
            },
            child: Image.network(imgUrl,
                width: w,
                height: h,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      itemCount: pics.length,
      currentPageIndex: _currentIndex,
      computeAspectRadio: (index) {
        return calculateImgScale(index!);
      },
      notifyScroll: (scrollNotification) {},
    );
    return child;
  }
}

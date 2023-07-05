/*
 Original Author
 MIT License

Copyright (c) 2017 serenader (Originally)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 */

import 'dart:async';

import 'package:flutter/material.dart';

/// Use this widget [VxSwiper] to give your list a swipeable effect with full customization.
class VxSwiper extends StatefulWidget {
  VxSwiper(
      {super.key,
      required List<Widget> this.items,
      this.height,
      this.aspectRatio = 16 / 9,
      this.viewportFraction = 0.8,
      this.initialPage = 0,
      int realPage = 10000,
      this.enableInfiniteScroll = true,
      this.reverse = false,
      this.autoPlay = false,
      this.autoPlayInterval = const Duration(seconds: 5),
      this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
      this.autoPlayCurve = Curves.fastOutSlowIn,
      this.pauseAutoPlayOnTouch,
      this.enlargeCenterPage = false,
      this.onPageChanged,
      this.scrollPhysics,
      this.isFastScrollingEnabled = false,
      this.scrollDirection = Axis.horizontal})
      : realPage = enableInfiniteScroll ? realPage + initialPage : initialPage,
        itemCount = items.length,
        itemBuilder = null,
        pageController = PageController(
          viewportFraction: viewportFraction as double,
          initialPage: enableInfiniteScroll
              ? realPage + (initialPage as int)
              : initialPage as int,
        );

  VxSwiper.builder(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.height,
      this.aspectRatio = 16 / 9,
      this.viewportFraction = 0.8,
      this.initialPage = 0,
      int realPage = 10000,
      this.enableInfiniteScroll = true,
      this.reverse = false,
      this.autoPlay = false,
      this.autoPlayInterval = const Duration(seconds: 5),
      this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
      this.autoPlayCurve = Curves.fastOutSlowIn,
      this.pauseAutoPlayOnTouch,
      this.enlargeCenterPage = false,
      this.onPageChanged,
      this.scrollPhysics,
      this.isFastScrollingEnabled = false,
      this.scrollDirection = Axis.horizontal})
      : realPage = enableInfiniteScroll ? realPage + initialPage : initialPage,
        items = null,
        pageController = PageController(
          viewportFraction: viewportFraction as double,
          initialPage: enableInfiniteScroll
              ? realPage + (initialPage as int)
              : initialPage as int,
        );

  /// The widgets to be shown in the carousel of default constructor
  final List<Widget>? items;

  /// The widget item builder that will be used to build item on demand
  final IndexedWidgetBuilder? itemBuilder;

  /// The widgets count that should be shown at carousel
  final int itemCount;

  /// Set carousel height and overrides any existing [aspectRatio].
  final double? height;

  /// Aspect ratio is used if no height have been declared.
  ///
  /// Defaults to 16:9 aspect ratio.
  final double aspectRatio;

  /// The fraction of the viewport that each page should occupy.
  ///
  /// Defaults to 0.8, which means each page fills 80% of the carousel.
  final num viewportFraction;

  /// The initial page to show when first creating the [VxSwiper].
  ///
  /// Defaults to 0.
  final num initialPage;

  /// The actual index of the [PageView].
  ///
  /// This value can be ignored unless you know the carousel will be scrolled
  /// backwards more then 10000 pages.
  /// Defaults to 10000 to simulate infinite backwards scrolling.
  final num realPage;

  ///Determines if carousel should loop infinitely or be limited to item length.
  ///
  ///Defaults to true, i.e. infinite loop.
  final bool enableInfiniteScroll;

  /// Reverse the order of items if set to true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// Enables auto play, sliding one page at a time.
  ///
  /// Use [autoPlayInterval] to determent the frequency of slides.
  /// Defaults to false.
  final bool autoPlay;

  /// Sets Duration to determent the frequency of slides when
  ///
  /// [autoPlay] is set to true.
  /// Defaults to 4 seconds.
  final Duration autoPlayInterval;

  /// The animation duration between two transitioning pages while in auto playback.
  ///
  /// Defaults to 800 ms.
  final Duration autoPlayAnimationDuration;

  /// Determines the animation curve physics.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve autoPlayCurve;

  /// Sets a timer on touch detected that pause the auto play with
  /// the given [Duration].
  ///
  /// Touch Detection is only active if [autoPlay] is true.
  final Duration? pauseAutoPlayOnTouch;

  /// Determines if current page should be larger then the side images,
  /// creating a feeling of depth in the carousel.
  ///
  /// Defaults to false.
  final bool? enlargeCenterPage;

  /// The axis along which the page view scrolls.
  ///
  /// Defaults to [Axis.horizontal].
  final Axis scrollDirection;

  /// Called whenever the page in the center of the viewport changes.
  final Function(int index)? onPageChanged;

  /// How the carousel should respond to user input.
  ///
  /// For example, determines how the items continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? scrollPhysics;

  /// [pageController] is created using the properties passed to the constructor
  /// and can be used to control the [PageView] it is passed to.
  final PageController pageController;

  /// [isFastScrollingEnabled] can be used to scrolling fast the [PageView].
  /// But it will not work if [autoPlay] is enabled. It also sets the [scrollPhysics] to [ClampingScrollPhysics].
  final bool isFastScrollingEnabled;

  /// Animates the controlled [VxSwiper] to the next page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> nextPage({required Duration duration, required Curve curve}) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  /// Animates the controlled [VxSwiper] to the previous page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> previousPage(
      {required Duration duration, required Curve curve}) {
    return pageController.previousPage(duration: duration, curve: curve);
  }

  /// Changes which page is displayed in the controlled [VxSwiper].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int page) {
    final index = _getRealIndex(
        pageController.page!.toInt(), realPage - initialPage as int, itemCount);
    return pageController
        .jumpToPage(pageController.page!.toInt() + page - index);
  }

  /// Animates the controlled [VxSwiper] from the current page to the given page.
  ///
  /// The animation lasts for the given duration and follows the given curve.
  /// The returned [Future] resolves when the animation completes.
  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) {
    final index = _getRealIndex(
        pageController.page!.toInt(), realPage - initialPage as int, itemCount);
    return pageController.animateToPage(
        pageController.page!.toInt() + page - index,
        duration: duration,
        curve: curve);
  }

  @override
  VxSwiperState createState() => VxSwiperState();
}

class VxSwiperState extends State<VxSwiper> with TickerProviderStateMixin {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = getTimer();
  }

  Timer? getTimer() {
    return widget.autoPlay
        ? Timer.periodic(widget.autoPlayInterval, (_) {
            widget.pageController.nextPage(
                duration: widget.autoPlayAnimationDuration,
                curve: widget.autoPlayCurve);
          })
        : null;
  }

  void pauseOnTouch() {
    timer!.cancel();
    timer = Timer(widget.pauseAutoPlayOnTouch!, () {
      timer = getTimer();
    });
  }

  Widget fastScrollWidget(Widget child) {
    int? t; //Tid
    late double p; //Position
    return Listener(
        onPointerMove: (pos) {
          //Get pointer position when pointer moves
          //If time since last scroll is undefined or over 100 milliseconds
          if (t == null || DateTime.now().millisecondsSinceEpoch - t! > 100) {
            t = DateTime.now().millisecondsSinceEpoch;
            p = pos.position.dx; //x position
          } else {
            //Calculate velocity
            final double v = (p - pos.position.dx) /
                (DateTime.now().millisecondsSinceEpoch - t!);
            if (v < -2 || v > 2) {
              final vx = (v * 1.2).isFinite ? (v * 1.2).round() : 0;
              //Don't run if velocity is to low
              //Move to page based on velocity (increase velocity multiplier to scroll further)
              widget.pageController.animateToPage(
                  widget.pageController.page!.toInt() + vx,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic);
            }
          }
        },
        child: child);
  }

  Widget getWrapper(Widget child) {
    if (widget.height != null) {
      final Widget wrapper = SizedBox(height: widget.height, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : (widget.isFastScrollingEnabled
              ? fastScrollWidget(wrapper)
              : wrapper);
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.aspectRatio, child: child);
      return widget.autoPlay && widget.pauseAutoPlayOnTouch != null
          ? addGestureDetection(wrapper)
          : (widget.isFastScrollingEnabled
              ? fastScrollWidget(wrapper)
              : wrapper);
    }
  }

  Widget addGestureDetection(Widget child) =>
      GestureDetector(onPanDown: (_) => pauseOnTouch(), child: child);

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return getWrapper(PageView.builder(
      physics: widget.isFastScrollingEnabled
          ? const ClampingScrollPhysics()
          : widget.scrollPhysics,
      scrollDirection: widget.scrollDirection,
      controller: widget.pageController,
      reverse: widget.reverse,
      itemCount: widget.enableInfiniteScroll ? null : widget.itemCount,
      onPageChanged: (int index) {
        final int currentPage = _getRealIndex(
            index + (widget.initialPage as int),
            widget.realPage as int,
            widget.itemCount);
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(currentPage);
        }
      },
      itemBuilder: (BuildContext context, int i) {
        final int index = _getRealIndex(i + (widget.initialPage as int),
            widget.realPage as int, widget.itemCount);

        return AnimatedBuilder(
          animation: widget.pageController,
          child: (widget.items != null)
              ? widget.items![index]
              : widget.itemBuilder!(context, index),
          builder: (BuildContext context, child) {
            double? distortionValue = 1.0;
            // if `enlargeCenterPage` is true, we must calculate the carousel item's height
            // to display the visual effect
            if (widget.enlargeCenterPage != null &&
                widget.enlargeCenterPage == true) {
              double itemOffset;
              // pageController.page can only be accessed after the first build,
              // so in the first build we calculate the itemoffset manually
              try {
                itemOffset = widget.pageController.page! - i;
              } catch (e) {
                final BuildContext storageContext =
                    widget.pageController.position.context.storageContext;
                final double? previousSavedPosition =
                    PageStorage.of(storageContext).readState(storageContext)
                        as double?;
                if (previousSavedPosition != null) {
                  itemOffset = previousSavedPosition - i.toDouble();
                } else {
                  itemOffset = widget.realPage.toDouble() - i.toDouble();
                }
              }
              final distortionRatio =
                  (1 - (itemOffset.abs() * 0.3)).clamp(0.0, 1.0);
              distortionValue = Curves.easeOut.transform(distortionRatio);
            }
            final double height = widget.height ??
                MediaQuery.sizeOf(context).width * (1 / widget.aspectRatio);

            if (widget.scrollDirection == Axis.horizontal) {
              return Center(
                  child:
                      SizedBox(height: distortionValue * height, child: child));
            } else {
              return Center(
                  child: SizedBox(
                      width: distortionValue * MediaQuery.sizeOf(context).width,
                      child: child));
            }
          },
        );
      },
    ));
  }
}

/// Converts an index of a set size to the corresponding index of a collection of another size
/// as if they were circular.
///
/// Takes a [position] from collection Foo, a [base] from where Foo's index originated
/// and the [length] of a second collection Baa, for which the correlating index is sought.
///
/// For example; We have a Carousel of 10000(simulating infinity) but only 6 images.
/// We need to repeat the images to give the illusion of a never ending stream.
/// By calling _getRealIndex with position and base we get an offset.
/// This offset modulo our length, 6, will return a number between 0 and 5, which represent the image
/// to be placed in the given position.
int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remainder(offset, length);
}

/// Returns the remainder of the modulo operation [input] % [source], and adjust it for
/// negative values.
int _remainder(int input, int source) {
  if (source == 0) {
    return 0;
  }
  final int result = input % source;
  return result < 0 ? source + result : result;
}

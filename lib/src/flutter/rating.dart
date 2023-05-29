/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';

/// VxRating widget to show ratings to the user and the user can change it too. Fully customizable
class VxRating extends StatefulWidget {
  /// Stars count
  final int count;

  /// The maximum rating which can be given
  final double maxRating;

  /// Currently selected value
  final double value;

  /// Size of the icon/image
  final double size;

  /// To give space between the stars/icons
  final double padding;

  /// To provide a custom image of star/rating (unselected)
  final dynamic normalImage;

  /// To provide a custom image of star/rating (selected)
  final dynamic selectImage;

  /// Unselected color of the icon
  final Color normalColor;

  /// Selected color of the icon
  final Color selectionColor;

  /// If the rating is selectable or not
  final bool isSelectable;

  /// true if Half star not allowed
  final bool stepInt;

  /// Use onRatingUpdate to get the selected value.
  final ValueChanged<String> onRatingUpdate;

  const VxRating({
    super.key,
    this.maxRating = 10.0,
    this.count = 5,
    this.value = 10.0,
    this.size = 20,
    this.normalImage,
    this.selectImage,
    this.padding = 0,
    this.normalColor = Colors.grey,
    this.selectionColor = Colors.red,
    this.isSelectable = true,
    this.stepInt = false,
    required this.onRatingUpdate,
  });

  @override
  VxRatingState createState() => VxRatingState();
}

class VxRatingState extends State<VxRating> {
  num? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        double x = event.localPosition.dx;
        if (x < 0) {
          x = 0;
        }
        pointValue(x);
      },
      onPointerMove: (PointerMoveEvent event) {
        double x = event.localPosition.dx;
        if (x < 0) {
          x = 0;
        }
        pointValue(x);
      },
      onPointerUp: (_) {},
      behavior: HitTestBehavior.deferToChild,
      child: buildRowRating(),
    );
  }

  void pointValue(double dx) {
    if (!widget.isSelectable) {
      return;
    }
    if (dx >=
        widget.size * widget.count + widget.padding * (widget.count - 1)) {
      value = widget.maxRating;
    } else {
      for (double i = 1; i < widget.count + 1; i++) {
        if (dx > widget.size * i + widget.padding * (i - 1) &&
            dx < widget.size * i + widget.padding * i) {
          value = i * (widget.maxRating / widget.count);
          break;
        } else if (dx > widget.size * (i - 1) + widget.padding * (i - 1) &&
            dx < widget.size * i + widget.padding * i) {
          value = (dx - widget.padding * (i - 1)) /
              (widget.size * widget.count) *
              widget.maxRating;
          break;
        }
      }
    }
    setState(() {
      widget.onRatingUpdate(value!.toStringAsFixed(1));
    });
  }

  int fullStars() {
    if (value != null) {
      return (value! / (widget.maxRating / widget.count)).floor();
    }
    return 0;
  }

  num star() {
    if (value != null) {
      if (widget.count / fullStars() == widget.maxRating / value!) {
        return 0;
      }
      final num temp = (value! % (widget.maxRating / widget.count)) /
          (widget.maxRating / widget.count);
      if (widget.stepInt) {
        return temp.ceil();
      }
      return temp;
    }
    return 0;
  }

  List<Widget> buildRow() {
    final int full = fullStars();
    final List<Widget> children = [];
    for (int i = 0; i < full; i++) {
      children.add(getStarItemView(
        widget.selectImage,
        widget.selectionColor,
      ));
      if (i < widget.count - 1) {
        children.add(
          SizedBox(
            width: widget.padding,
          ),
        );
      }
    }
    if (full < widget.count) {
      children.add(ClipRect(
        clipper: _VxClipper(
          rating: star() * widget.size,
        ),
        child: getStarItemView(
          widget.selectImage,
          widget.selectionColor,
        ),
      ));
    }

    return children;
  }

  Widget getStarItemView(dynamic path, Color color) {
    if (path is IconData) {
      return Icon(
        path,
        size: widget.size,
        color: color,
      );
    } else if (path is String) {
      return Image.asset(
        path,
        height: widget.size,
        width: widget.size,
        color: color,
      );
    }
    return Icon(
      Icons.star,
      size: widget.size,
      color: color,
    );
  }

  List<Widget> buildNormalRow() {
    final List<Widget> children = [];
    for (int i = 0; i < widget.count; i++) {
      children.add(
        getStarItemView(
          widget.normalImage,
          widget.normalColor,
        ),
      );
      if (i < widget.count - 1) {
        children.add(
          SizedBox(
            width: widget.padding,
          ),
        );
      }
    }
    return children;
  }

  Widget buildRowRating() {
    final List<Widget> children = [];
    children.add(
      Row(
        children: buildNormalRow(),
      ),
    );
    children.add(
      Row(
        children: buildRow(),
      ),
    );
    return SizedBox(
      width: widget.count * widget.size + (widget.count - 1) * widget.padding,
      child: Stack(
        children: children,
      ),
    );
  }
}

class _VxClipper extends CustomClipper<Rect> {
  final double rating;

  _VxClipper({required this.rating});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0.0,
      0.0,
      rating,
      size.height,
    );
  }

  @override
  bool shouldReclip(_VxClipper oldClipper) {
    return rating != oldClipper.rating;
  }
}

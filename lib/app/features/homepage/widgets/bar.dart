import 'dart:math';
import 'package:bar/app/features/homepage/models/bar_item.dart';
import 'package:flutter/material.dart';
import 'package:bar/app/utils/theme_data/theme.dart';

///[Bar] Widget Renders the Bar which can show the range of values with different color.
///
///Params:
///#[items] : List of [BarItem], Each [BarItem] signifies one range in Bar.
///#[posArrow] : Position of Arrow.
class Bar extends StatefulWidget {
  final List<BarItem> items;
  final int posArrow;
  const Bar({super.key, required this.items, required this.posArrow});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  ///Final Value of the Bar.
  late int upperLimit;

  ///Lowest Value of the Bar.
  late int lowerLimit;

  ///[upperLimit]-[lowerLimit].
  late double barWidth;

  ///The amount of value each pixel will cover in the bar.
  late double perPXunit;

  ///Height of Bar.
  final barHeight = 24.0;

  ///Size of the Arrow Icon.
  final arrowSize = 52.0;

  @override
  void initState() {
    super.initState();

    ///To throw Error Whenever the user tries to pass items as Empty List
    assert(widget.items.isNotEmpty);

    ///Making sure items are in order.
    widget.items.sort((a, b) => a.start.compareTo(b.start));

    ///Assiging Values.
    lowerLimit = widget.items.first.start;
    upperLimit = widget.items.last.end;
    assert(upperLimit > lowerLimit);
  }

  ///Using didChangeDependencies so that our Bar width Change on Rotation of device.
  @override
  void didChangeDependencies() {
    ///calculating Bar Width. Using 16px as Margin to both the side.
    barWidth = MediaQuery.sizeOf(context).width - (16 * 2);
    perPXunit = barWidth / (upperLimit - lowerLimit);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            children: List.generate(
                widget.items.length,
                (index) => Container(
                      decoration: BoxDecoration(
                          color: widget.items[index].color,

                          ///Assinging BorderRadius to First range and last range.
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(index == 0 ? 12 : 0),
                            bottomLeft: Radius.circular(index == 0 ? 12 : 0),
                            topRight: Radius.circular(
                                index == widget.items.length - 1 ? 12 : 0),
                            bottomRight: Radius.circular(
                                index == widget.items.length - 1 ? 12 : 0),
                          )),
                      height: barHeight,
                      width: widget.items[index].length * perPXunit,
                    )),
          ),

          Positioned(

              ///using [widget.items.last.end] & [widget.items.first.start] so that our arrow stays within the range.
              ///
              ///Addition and Subtaction of 1 is because of the BorderRadius makes it looks like arrow
              ///is outside the range when it is at extreme.
              left: max(min(widget.posArrow, widget.items.last.end - 1),
                          widget.items.first.start + 1) *
                      perPXunit -
                  (arrowSize / 2),
              top: barHeight / 2,
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_drop_up_rounded,
                    size: arrowSize,
                  ),
                  Text(
                    max(min(widget.posArrow, widget.items.last.end),
                          widget.items.first.start ) .toString(),
                    style: TT.f16w600,
                  )
                ],
              )),

          ///These are visible checkpoints on the Bar.
          ...List.generate(
              widget.items.length + 1,
              (index) => (index == widget.items.length)

                  ///Last one is seperate because there n+1 numbers, Where n is number of ranges.
                  ? Positioned(
                      top: (index % 2 == 0) ? barHeight : -barHeight,
                      left: widget.items.last.end * perPXunit - 7,
                      child: Text(
                        widget.items.last.end.toString(),
                        style: TT.f16w600,
                      ))
                  : Positioned(

                      ///Even ones show up at the bottom and Odd ones show up at top
                      top: (index % 2 == 0) ? barHeight : -barHeight,
                      left: widget.items[index].start * perPXunit - 7,
                      child: Text(
                        widget.items[index].start.toString(),
                        style: TT.f16w600,
                      )))
        ],
      ),
    );
  }
}

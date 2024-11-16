import 'package:flutter/material.dart';

class SolidAppDivider extends StatelessWidget {
  final double thickness;
  final Color color;

  const SolidAppDivider({
    Key? key,
    this.thickness = 1.0,
    this.color = const Color(0xFFD3D3D3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color,
    );
  }
}

class DashedAppDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashSpacing;

  const DashedAppDivider({
    Key? key,
    this.thickness = 1.0,
    this.color = const Color(0xFFD3D3D3), // Màu xám nhạt
    this.dashWidth = 5.0,
    this.dashSpacing = 3.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.constrainWidth();
        final int dashCount = (width / (dashWidth + dashSpacing)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: thickness,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}


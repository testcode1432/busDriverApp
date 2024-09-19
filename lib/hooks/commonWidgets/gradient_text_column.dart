import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientTextAndIcon extends StatelessWidget {
  const GradientTextAndIcon({
    super.key,
    required this.gradienttextcolumn,
    required this.svgUrl,
  });
  final Widget gradienttextcolumn;
  final String svgUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [gradienttextcolumn, SvgPicture.asset(svgUrl)],
    );
  }
}

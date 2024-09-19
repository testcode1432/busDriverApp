import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOntapSvg extends StatelessWidget {
  const CustomOntapSvg({
    super.key,
    required this.ontap,
    required this.svgUrl,
  });
  final Function() ontap;
  final String svgUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SvgPicture.asset(
        svgUrl,
        width: 24,
        color: ktextYellow,
      ),
    );
  }
}

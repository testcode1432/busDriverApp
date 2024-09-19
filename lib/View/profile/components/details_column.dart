import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({
    super.key,
    required this.keytext,
    required this.valueText,
  });
  final String keytext;
  final String valueText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldTextBlack(text: keytext),
          NormalTextBlack(text: valueText)
        ],
      ),
    );
  }
}

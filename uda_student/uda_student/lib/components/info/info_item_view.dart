import 'package:flutter/material.dart';
import 'package:uda_qlsv/theme/color.dart';

class InfoItemView extends StatelessWidget {
  const InfoItemView({Key? key, required this.label, required this.content})
      : super(key: key);

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(label,
              style: const TextStyle(
                  color: kTextColor, fontWeight: FontWeight.w600)),
          fit: FlexFit.tight,
          flex: 3,
        ),
        Flexible(
          child: Text(content, style: const TextStyle(color: kTextColor)),
          flex: 4,
        )
      ],
    );
  }
}

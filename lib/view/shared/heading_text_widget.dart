import 'package:flutter/material.dart';
import '../../utils/constants/typography_constants.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppTypography.roboto(),
      ),
    );
  }
}

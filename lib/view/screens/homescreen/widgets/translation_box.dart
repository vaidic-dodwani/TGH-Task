import 'package:flutter/material.dart';
import '../../../../utils/constants/typography_constants.dart';

final borderdesign = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 2));

class TranslationBoxes extends StatefulWidget {
  const TranslationBoxes({super.key});

  @override
  State<TranslationBoxes> createState() => _TranslationBoxesState();
}

class _TranslationBoxesState extends State<TranslationBoxes> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
          color: Colors.white24),
      child: TextFormField(
        onChanged: (value) {},
        controller: controller,
        minLines: 7,
        maxLines: 7,
        style: AppTypography.roboto(),
        decoration: InputDecoration(
          counterText: "",
          border: borderdesign,
          enabledBorder: borderdesign,
          errorBorder: borderdesign,
          focusedBorder: borderdesign,
          disabledBorder: borderdesign,
          focusedErrorBorder: borderdesign,
        ),
      ),
    );
  }
}

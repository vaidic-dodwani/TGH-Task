import 'package:flutter/material.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/bottom_builder.dart';
import 'package:tgh_task/view/shared/code_to_name_function.dart';

import '../../../../utils/constants/typography_constants.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return const BottomBuilder();
          },
        );
      },
      child: Container(
        width: size.width * 0.4,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20),
            border: Border.all()),
        child: Center(
          child: Text(
            codeToNameFunction("en"),
            style: AppTypography.roboto(),
          ),
        ),
      ),
    );
  }
}

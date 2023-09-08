import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgh_task/view/shared/code_to_name_function.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox.shrink();
            //TODO add bottom builder here
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
            style: GoogleFonts.roboto(),
          ),
        ),
      ),
    );
  }
}

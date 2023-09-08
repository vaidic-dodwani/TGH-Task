import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/bottom_builder.dart';
import 'package:tgh_task/view_model/language_view_model/languages_view_model.dart';

import '../../../../utils/constants/translation_flow_controller.dart';
import '../../../../utils/constants/typography_constants.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({super.key, required this.translationFlow});

  final String translationFlow;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return BottomBuilder(translationFlow: translationFlow);
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
          child: Consumer<LanguagesNotifier>(
            builder: (context, prov, child) {
              if (translationFlow == TranslationFlow.translateFrom) {
                return Text(
                  prov.translateFromLanguage.longLanguage,
                  style: AppTypography.roboto(),
                );
              } else {
                return Text(
                    prov.translateToLanguage.longLanguage,
                    style: AppTypography.roboto(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

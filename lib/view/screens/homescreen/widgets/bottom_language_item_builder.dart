import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_task/utils/constants/translation_flow_controller.dart';
import 'package:tgh_task/utils/constants/typography_constants.dart';
import 'package:tgh_task/view_model/language_view_model/languages_view_model.dart';

class BottomLanguageItemBuilder extends StatelessWidget {
  const BottomLanguageItemBuilder(
      {super.key, required this.index, required this.translationFlow});
  final int index;
  final String translationFlow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Consumer<LanguagesNotifier>(
        builder: (context, prov, child) => GestureDetector(
          onTap: () {
            if (translationFlow == TranslationFlow.translateFrom) {
              prov.translateFromLanguage = prov.languages![index];
            } else {
              prov.translateToLanguage = prov.languages![index + 1];
            }
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  translationFlow == TranslationFlow.translateFrom
                      ? prov.languages![index].longLanguage
                      : prov.languages![index + 1].longLanguage,
                  style: AppTypography.raleway(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

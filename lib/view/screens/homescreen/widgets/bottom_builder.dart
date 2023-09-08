import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_task/utils/constants/colors/app_colors.dart';
import 'package:tgh_task/utils/constants/translation_flow_controller.dart';
import 'package:tgh_task/utils/constants/typography_constants.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/bottom_language_item_builder.dart';
import 'package:tgh_task/view_model/language_view_model/languages_view_model.dart';

final borderdesign = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white70));

class BottomBuilder extends StatefulWidget {
  const BottomBuilder({super.key, required this.translationFlow});

  final String translationFlow;

  @override
  State<BottomBuilder> createState() => _BottomBuilderState();
}

class _BottomBuilderState extends State<BottomBuilder> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text =
        Provider.of<LanguagesNotifier>(context, listen: false).searchText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "From",
            style: AppTypography.raleway(
                color: Colors.white70, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            onChanged: (value) {
              final prov =
                  Provider.of<LanguagesNotifier>(context, listen: false);

              prov.searchText = value;
            },
            decoration: InputDecoration(
              border: borderdesign,
              enabledBorder: borderdesign,
              errorBorder: borderdesign,
              focusedBorder: borderdesign,
              disabledBorder: borderdesign,
              focusedErrorBorder: borderdesign,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "All languages",
            style: AppTypography.raleway(
                color: Colors.white70, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Consumer<LanguagesNotifier>(
            builder: (context, prov, child) {
              if (prov.languages == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        widget.translationFlow == TranslationFlow.translateFrom
                            ? prov.languages!.length
                            : prov.languages!.length - 1,
                    itemBuilder: (context, index) {
                      {
                        if (widget.translationFlow ==
                            TranslationFlow.translateFrom) {
                          if (prov.languages![index].longLanguage
                              .toLowerCase()
                              .contains(prov.searchText.toLowerCase())) {
                            return BottomLanguageItemBuilder(
                                index: index,
                                translationFlow: widget.translationFlow);
                          } else {
                            return const SizedBox.shrink();
                          }
                        } else {
                          if (prov.languages![index + 1].longLanguage
                              .toLowerCase()
                              .contains(prov.searchText.toLowerCase())) {
                            return BottomLanguageItemBuilder(
                                index: index + 1,
                                translationFlow: widget.translationFlow);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                      }
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

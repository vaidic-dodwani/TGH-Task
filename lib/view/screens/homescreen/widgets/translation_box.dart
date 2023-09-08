import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_task/utils/constants/translation_flow_controller.dart';
import '../../../../utils/constants/typography_constants.dart';
import '../../../../view_model/language_view_model/languages_view_model.dart';

final borderdesign = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 2));

class TranslationBoxes extends StatefulWidget {
  const TranslationBoxes({super.key, required this.translationFlow});

  final String translationFlow;
  @override
  State<TranslationBoxes> createState() => _TranslationBoxesState();
}

class _TranslationBoxesState extends State<TranslationBoxes> {
  final controller = TextEditingController();

  @override
  void initState() {
    if (widget.translationFlow == TranslationFlow.translateFrom) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final prov = Provider.of<LanguagesNotifier>(context, listen: false);
        final debouncer = Debouncer<String>(const Duration(milliseconds: 500),
            initialValue: "");
        controller.addListener(() => debouncer.value = controller.text);
        debouncer.values.listen((search) => prov.translateFromText = search);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
          color: Colors.white24),
      child: Consumer<LanguagesNotifier>(
        builder: (context, value, child) {
          if (widget.translationFlow == TranslationFlow.translateTo) {
            controller.text = value.translateToText;
          }
          return TextFormField(
            readOnly: widget.translationFlow == TranslationFlow.translateTo,
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
          );
        },
      ),
    );
  }
}

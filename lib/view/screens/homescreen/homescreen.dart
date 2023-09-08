import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_task/utils/constants/colors/app_colors.dart';
import 'package:tgh_task/utils/constants/translation_flow_controller.dart';
import 'package:tgh_task/utils/constants/typography_constants.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/country_button.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/translation_box.dart';
import '../../../view_model/language_view_model/languages_view_model.dart';
import '../../shared/heading_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LanguagesNotifier>(context, listen: false).getLanguages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackBG,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: AppColors.blackBG,
          title: Consumer<LanguagesNotifier>(
            builder: (context, prov, child) => Text(
              prov.translationLoading ? "Translating......" : "Text Translate",
              style: AppTypography.raleway(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Consumer<LanguagesNotifier>(
              builder: (context, prov, child) => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    //Divider

                    prov.translationLoading
                        ? const LinearProgressIndicator()
                        : const Divider(thickness: 4, color: Colors.white38),

                    const SizedBox(height: 10),

                    //Buttons
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CountryButton(
                            translationFlow: TranslationFlow.translateFrom),
                        Icon(Icons.arrow_right_alt_outlined,
                            color: Colors.white24),
                        CountryButton(
                            translationFlow: TranslationFlow.translateTo),
                      ],
                    ),

                    const SizedBox(height: 10),

                    //Input Dialogue Box
                    HeadingTextWidget(
                        text:
                            "Translate From ${prov.translateFromLanguage.longLanguage}"),
                    const SizedBox(height: 10),
                    const TranslationBoxes(
                      translationFlow: TranslationFlow.translateFrom,
                    ),

                    //Output Dialogue Box
                    const SizedBox(height: 10),
                    HeadingTextWidget(
                        text:
                            "Translate To ${prov.translateToLanguage.longLanguage}"),
                    const SizedBox(height: 10),
                    const TranslationBoxes(
                      translationFlow: TranslationFlow.translateTo,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

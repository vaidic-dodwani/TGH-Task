import 'package:flutter/material.dart';
import 'package:tgh_task/utils/constants/typography_constants.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/country_button.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/translation_box.dart';
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
      // Provider.of<LanguagesNotifier>(context, listen: false).getLanguages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Colors.black,
          title: Text(
            "Text Translation",
            style: AppTypography.raleway(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                //Divider
                Divider(thickness: 1, color: Colors.white38),

                SizedBox(height: 10),

                //Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CountryButton(),
                    Icon(Icons.arrow_right_alt_outlined, color: Colors.white24),
                    CountryButton(),
                  ],
                ),

                SizedBox(height: 10),

                //Input Dialogue Box
                HeadingTextWidget(text: "Translate From ENGLISH"),
                SizedBox(height: 10),
                TranslationBoxes(),

                //Output Dialogue Box
                SizedBox(height: 10),
                HeadingTextWidget(text: "Translate To HINDI"),
                SizedBox(height: 10),
                TranslationBoxes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

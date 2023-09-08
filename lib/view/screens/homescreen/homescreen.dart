import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/country_button.dart';
import 'package:tgh_task/view/screens/homescreen/widgets/translation_box.dart';
import '../../shared/heading_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Text Translation",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
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
    );
  }
}
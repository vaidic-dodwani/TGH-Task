import 'package:flutter/material.dart';
import 'package:tgh_task/utils/constants/colors/app_colors.dart';
import 'package:tgh_task/utils/constants/typography_constants.dart';

final borderdesign = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white70));

class BottomBuilder extends StatefulWidget {
  const BottomBuilder({super.key});
  @override
  State<BottomBuilder> createState() => _BottomBuilderState();
}

class _BottomBuilderState extends State<BottomBuilder> {
  final controller = TextEditingController();

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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                {
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      child: Text(
                        "some language",
                        textAlign: TextAlign.left,
                        style: AppTypography.roboto(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

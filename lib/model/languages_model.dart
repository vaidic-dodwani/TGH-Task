import 'package:tgh_task/view/shared/code_to_name_function.dart';

class Language {
  final String shortLanguage;
  final String longLanguage;
  Language({
    required this.shortLanguage,
    required this.longLanguage,
  });
  factory Language.fromJson(Map<String, dynamic> json) => Language(
        shortLanguage: json["language"],
        longLanguage: codeToNameFunction(json["language"]),
      );
}

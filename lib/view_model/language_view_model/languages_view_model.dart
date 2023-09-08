import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tgh_task/model/languages_model.dart';
import 'package:tgh_task/repository/languages_repository.dart';
import 'package:tgh_task/utils/toast_functions.dart';

import '../../view/shared/code_to_name_function.dart';

class LanguagesNotifier extends ChangeNotifier {
//
  bool _getLanguagesLoading = false;
//
  bool get getLanguagesLoading => _getLanguagesLoading;
//
  String _translateFromText = "Hey There";
  String get translateFromText => _translateFromText;
  set translateFromText(String _) {
    _translateFromText = _;
    translate();
  }

  //
  bool _translationLoading = false;
//
  bool get translationLoading => _translationLoading;

//
  String _translateToText = "";
  String get translateToText => _translateToText;
  set translateToText(String _) {
    _translateToText = _;
    notifyListeners();
  }

//
  Language _translateFromLanguage =
      Language(shortLanguage: "detect", longLanguage: "Detect");
  Language get translateFromLanguage => _translateFromLanguage;
  set translateFromLanguage(Language _) {
    _translateFromLanguage = _;
    translate();
  }

//
  Language _translateToLanguage =
      Language(shortLanguage: "select", longLanguage: "Select Language");
  Language get translateToLanguage => _translateToLanguage;
  set translateToLanguage(Language _) {
    _translateToLanguage = _;
    translate();
  }

//
  List<Language>? _languages = [
    Language(shortLanguage: "detect", longLanguage: "Detect")
  ];
  List<Language>? get languages => _languages;
//
  final languageRepo = LanguageRepository();
//
  void getLanguages() async {
    _getLanguagesLoading = true;
    notifyListeners();
    //
    //
    try {
      final output = await languageRepo.getLanguages();
      _languages = [Language(shortLanguage: "detect", longLanguage: "Detect")] +
          List<Language>.from(
              output['data']['languages'].map((x) => Language.fromJson(x)));
    } catch (e) {
      log(e.toString());
      _languages = null;
    }

    _getLanguagesLoading = false;
    notifyListeners();
  }

//
  void translate() async {
    _translationLoading = true;
    notifyListeners();
    Map<String, dynamic> body = {
      'q': translateFromText,
      'target': translateToLanguage.shortLanguage
    };

    try {
      if (translateToLanguage.shortLanguage == "select") {
        translateToText = "Select a Language First";
        _translationLoading = false;
        notifyListeners();
        return;
      }
      final output = await languageRepo.translate(body);
      translateToText = output['data']['translations'][0]['translatedText'];
      if (translateFromLanguage.shortLanguage == 'detect') {
        translateFromLanguage = Language(
            shortLanguage: output['data']['translations'][0]
                ['detectedSourceLanguage'],
            longLanguage: codeToNameFunction(
                output['data']['translations'][0]['detectedSourceLanguage']));
      }
      _translationLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      translateToText = "Error";
      _translationLoading = false;
      notifyListeners();
    }
    log(translateToText.toString());
  }
//
}

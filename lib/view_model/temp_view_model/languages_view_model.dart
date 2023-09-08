import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tgh_task/model/languages_model.dart';
import 'package:tgh_task/repository/languages_repository.dart';

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
    notifyListeners();
  }

//
  String _translateToText = "";
  String get translateToText => _translateToText;
  set translateToText(String _) {
    _translateToText = _;
    notifyListeners();
  }

//
  Language? _translateFromLanguage;
  Language? get translateFromLanguage => _translateFromLanguage;
  set translateFromLanguage(Language? _) {
    _translateFromLanguage = _;
    notifyListeners();
  }

//
  Language? _translateToLanguage =
      Language(shortLanguage: "hi", longLanguage: "Hindi");
  Language? get translateToLanguage => _translateToLanguage;
  set translateToLanguage(Language? _) {
    _translateToLanguage = _;
    notifyListeners();
  }

//
  List<Language>? _languages = [];
  List<Language>? get languages => _languages;
  final languageRepo = LanguageRepository();
  void getLanguages() async {
    _getLanguagesLoading = true;
    notifyListeners();
    //
    //
    try {
      final output = await languageRepo.getLanguages();
      _languages = List<Language>.from(
          output['data']['languages'].map((x) => Language.fromJson(x)));
    } catch (e) {
      _languages = null;
    }

    _getLanguagesLoading = false;
    notifyListeners();
  }

//
  void translate() async {
    Map<String, dynamic> body = {
      'q': translateFromText,
      'target': translateToLanguage!.shortLanguage
    };

    try {
      final output = await languageRepo.translate(body);
      translateToText = output['data']['translations'][0]['translatedText'];
    } catch (e) {
      translateToText = "Error";
    }
    log(translateToText.toString());
  }

//
}

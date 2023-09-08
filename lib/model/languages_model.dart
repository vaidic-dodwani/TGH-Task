class Language {
  final String language;

  Language({
    required this.language,
  });

  Language copyWith({
    String? language,
  }) =>
      Language(
        language: language ?? this.language,
      );

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}

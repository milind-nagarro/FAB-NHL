import 'package:fab_nhl/common/utilities/app_constants.dart';

class WelcomeState {
  const WelcomeState({required this.pageNumber, required this.message});
  final String message;
  final int pageNumber;
}

class LanguageState {
  LanguageState(this.language) {
    nextLanguageTitle =
        language == AppLanguage.english ? arabic_label : english_label;
  }
  final AppLanguage language;
  late String nextLanguageTitle;
}

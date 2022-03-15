import 'package:fab_nhl/common/utilities/app_constants.dart';
import 'package:equatable/equatable.dart';

class WelcomeState extends Equatable {
  const WelcomeState({required this.pageNumber, required this.message});
  final String message;
  final int pageNumber;

  @override
  List<Object?> get props => [pageNumber];
}

class LanguageState extends Equatable {
  LanguageState(this.language) {
    nextLanguageTitle =
        language == AppLanguage.english ? arabic_label : english_label;
  }
  final AppLanguage language;
  late String nextLanguageTitle;

  @override
  List<Object?> get props => [language];
}

import 'package:fab_nhl/common/utilities/app_constants.dart';
import 'package:fab_nhl/module/welcome/state/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit()
      : super(WelcomeState(message: welcomeScreenTitles[0], pageNumber: 0));
  void changePage(int page) =>
      emit(WelcomeState(message: welcomeScreenTitles[page], pageNumber: page));
}

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(AppLanguage english)
      : super(LanguageState(AppLanguage.english));
  void changeLanguage() {
    if (state.language == AppLanguage.english) {
      emit(LanguageState(AppLanguage.arabic));
    } else {
      emit(LanguageState(AppLanguage.english));
    }
  }
}

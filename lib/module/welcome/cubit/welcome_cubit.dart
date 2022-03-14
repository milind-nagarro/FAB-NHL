import 'package:fab_nhl/common/utilities/app_constants.dart';
import 'package:fab_nhl/module/welcome/model/welcome_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit()
      : super(WelcomeState(message: welcomeScreenTitles[0].tr, pageNumber: 0));
  void changePage(int page) => emit(
      WelcomeState(message: welcomeScreenTitles[page].tr, pageNumber: page));
}

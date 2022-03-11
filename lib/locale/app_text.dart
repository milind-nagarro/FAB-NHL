import 'package:fab_nhl/locale/arabic.dart' as arabic;
import 'package:fab_nhl/locale/english.dart' as english;
import 'package:get/get.dart';

class AppText extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': english.labels, 'ar': arabic.labels};
}

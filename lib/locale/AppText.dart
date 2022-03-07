import 'package:fab_nhl/locale/Arabic.dart' as arabic;
import 'package:fab_nhl/locale/English.dart' as english;
import 'package:get/get.dart';

class AppText extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': english.labels, 'ar': arabic.labels};
}

import 'dart:ui';
import 'package:mtm/repositories/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  static const String _localeLanguageCodeKey = 'localeLenguageCode';
  static const String _localeScriptCodeKey = 'localeScriptCode';
  static const String _localeCountryCodeKey = 'localeCountryCode';

  Future<void> saveLocale(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_localeLanguageCodeKey, locale!.languageCode);
    //wait prefs.setString(_localeScriptCodeKey, locale?.scriptCode);
    //await prefs.setString(_localeCountryCodeKey, locale?.countryCode);
  }

  @override
  Future<Locale> get locale async {
    final prefs = await SharedPreferences.getInstance();

    final languageCode = prefs.getString(_localeLanguageCodeKey);
    //final scriptCode = prefs.getString(_localeScriptCodeKey);
    //final countryCode = prefs.getString(_localeCountryCodeKey);

    if (languageCode != null) {
      return Locale(languageCode
          /*languageCode: ,
          scriptCode: scriptCode,
        //countryCode: countryCode */
          );
    }
    return Locale("mx");
  }
}

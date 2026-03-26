import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  // ============ DEFAULT VALUE ============
  static const double defaultFontSize = 14;
  static const double largerFontSize = 16;
  static const double largestFontSize = 20;
  static const double smallerFontSize = 14;
  static const double smallestFontSize = 12;

  static const double defaultPadding = 10;
  static const double defaultBorderRadius = 5;
  // ============ BOX HELPERS ============
  static Color getBoxBackgroundColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xff293331)
      : Color(0xffffffff);

  static Color getBoxBorderColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Colors.grey.shade800
      : Colors.grey.shade400;
  // ============ BODY HELPERS ============
  static Color getBodyBackgroundColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xff1F2625)
      : Color(0xfff3f5f9);
  static Color getBodyTextColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xfff3f5f9)
      : Color(0xff1F2625);

  static TextStyle getBodyTextStyle(ThemeData theme) => GoogleFonts.openSans(
    color: getBodyTextColor(theme),
    fontSize: defaultFontSize,
  );

  static TextStyle getButtonTextStyle(ThemeData theme) => GoogleFonts.openSans(
    color: getBodyTextColor(theme),
    fontSize: defaultFontSize,
  );

  static TextStyle getTextFieldTextStyle(ThemeData theme) =>
      GoogleFonts.openSans(
        color: getBodyTextColor(theme),
        fontSize: defaultFontSize,
      );

  // ============ PADDING HELPERS ============
  static EdgeInsets paddingAll({double? value}) {
    return EdgeInsets.all(value ?? defaultPadding);
  }

  static EdgeInsets paddingVertical({double? value}) {
    return EdgeInsets.symmetric(vertical: value ?? defaultPadding);
  }

  static EdgeInsets paddingHorizontal({double? value}) {
    return EdgeInsets.symmetric(horizontal: value ?? defaultPadding);
  }

  // ============ SIZED BOX HELPERS ============
  static SizedBox spacingVertical(double? height) {
    return SizedBox(height: height ?? defaultPadding);
  }

  static SizedBox spacingHorizontal(double? width) {
    return SizedBox(width: width ?? defaultPadding);
  }

  // ============ THEME HELPERS ============
  static ThemeData getTheme(String mode) {
    return mode == 'light' ? ThemeData.light() : ThemeData.dark();
  }
}

// Begin Box
class Box extends StatelessWidget {
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final Widget? child;
  const Box({
    this.padding,
    this.width,
    this.height,
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(Constant.defaultPadding),
      decoration: BoxDecoration(
        border:
            border ??
            Border.all(width: 1, color: Constant.getBoxBorderColor(theme)),
        color: backgroundColor ?? Constant.getBoxBackgroundColor(theme),
        borderRadius:
            borderRadius ??
            BorderRadius.all(Radius.circular(Constant.defaultBorderRadius)),
      ),
      child: child,
    );
  }
}
// End Box

// Begin Responsive Extension
extension ResponsiveExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 768;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= 768 &&
      MediaQuery.of(this).size.width < 1024;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}
// end Responsive Extension

// Begin Storage
class Storage {
  static const String _keyTheme = 'theme_mode'; // 'light' atau 'dark'
  static const String _keyLanguage = 'language'; // 'en' atau 'id'

  // Simpan theme mode
  static Future<void> setThemeMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTheme, mode);
  }

  // Ambil theme mode (default: light)
  static Future<String> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyTheme) ?? 'light';
  }

  // Simpan language
  static Future<void> setLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, langCode);
  }

  // Ambil language (default: en)
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage) ?? 'en';
  }
}
// End Storage

// Begin Theme Provider
class ThemeProvider extends ChangeNotifier {
  String _themeMode = 'light';

  String get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  // Load theme dari preferences
  Future<void> _loadTheme() async {
    _themeMode = await Storage.getThemeMode();
    notifyListeners();
  }

  // Toggle theme
  Future<void> toggleTheme() async {
    _themeMode = _themeMode == 'light' ? 'dark' : 'light';
    await Storage.setThemeMode(_themeMode);
    notifyListeners();
  }

  // Set theme specific
  Future<void> setTheme(String mode) async {
    _themeMode = mode;
    await Storage.setThemeMode(_themeMode);
    notifyListeners();
  }
}
// End Theme Provider

// Begin Abstract class untuk dictionary
abstract class Dictionary {
  // General
  String get appName;
  String get ok;
  String get cancel;
  String get yes;
  String get no;
  String get delete;
  String get save;
  String get edit;

  // Messages
  String get confirmationDelete;
  String get errorDefault;
  String get infoDefault;
  String get successDefault;

  // Auth
  String get username;
  String get password;
  String get login;
  String get logout;

  // Method untuk dynamic key (kalau perlu)
  String label(String key);
}
// End Abstract class untuk dictionary

// Begin Extension untuk Dictionary agar mudah diakses
extension DictionaryExtension on Dictionary {
  String labelUsername() => username;
  String labelPassword() => password;
}
// End Extension untuk Dictionary

// Begin Dictionary en
class DictionaryEn implements Dictionary {
  @override
  String get appName => 'My App';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get confirmationDelete => 'Are you sure you want to delete this item?';

  @override
  String get errorDefault => 'An error occurred. Please try again.';

  @override
  String get infoDefault => 'Information';

  @override
  String get successDefault => 'Operation completed successfully!';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String label(String key) {
    // Fallback untuk key yang belum didefinisikan
    return key;
  }
}
// End Dictionary en

// Begin Dictionary id
class DictionaryId implements Dictionary {
  @override
  String get appName => 'Aplikasi Saya';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Batal';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Tidak';

  @override
  String get delete => 'Hapus';

  @override
  String get save => 'Simpan';

  @override
  String get edit => 'Edit';

  @override
  String get confirmationDelete =>
      'Apakah Anda yakin ingin menghapus item ini?';

  @override
  String get errorDefault => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get infoDefault => 'Informasi';

  @override
  String get successDefault => 'Operasi berhasil!';

  @override
  String get username => 'Nama Pengguna';

  @override
  String get password => 'Kata Sandi';

  @override
  String get login => 'Masuk';

  @override
  String get logout => 'Keluar';

  @override
  String label(String key) {
    // Fallback untuk key yang belum didefinisikan
    return key;
  }
}
// End Dictionary Id

// Begin Language Provider
// Update bagian LanguageProvider
class LanguageProvider extends ChangeNotifier {
  Dictionary _dictionary = DictionaryEn();
  String _languageCode = 'en';

  Dictionary get dictionary => _dictionary;
  String get languageCode => _languageCode;

  LanguageProvider() {
    //debugPrint('🔧 LanguageProvider INITIALIZED');
    _loadLanguage();
  }

  // Load language dari preferences
  Future<void> _loadLanguage() async {
    //debugPrint('📖 _loadLanguage() STARTED');
    _languageCode = await Storage.getLanguage();
    //debugPrint('📖 Loaded language from storage: $_languageCode');
    _setDictionary(_languageCode);
    //debugPrint('📖 Dictionary set to: ${_dictionary.runtimeType}');
    notifyListeners();
    //debugPrint('📖 notifyListeners() CALLED for _loadLanguage');
  }

  // Set dictionary berdasarkan language code
  void _setDictionary(String code) {
    //debugPrint('🔄 _setDictionary() with code: $code');
    switch (code) {
      case 'id':
        _dictionary = DictionaryId();
        //debugPrint('✅ Dictionary set to INDONESIAN');
        break;
      default:
        _dictionary = DictionaryEn();
        //debugPrint('✅ Dictionary set to ENGLISH');
        break;
    }
  }

  // Toggle language (antara en dan id)
  Future<void> toggleLanguage() async {
    //debugPrint('🔄🔄🔄 TOGGLE LANGUAGE STARTED 🔄🔄🔄');
    //debugPrint('   Current language: $_languageCode');

    _languageCode = _languageCode == 'en' ? 'id' : 'en';
    //debugPrint('   New language: $_languageCode');

    _setDictionary(_languageCode);
    //debugPrint('   Dictionary type: ${_dictionary.runtimeType}');

    await Storage.setLanguage(_languageCode);
    //debugPrint('   Saved to storage: $_languageCode');

    notifyListeners();
    //debugPrint('✅ notifyListeners() CALLED for toggleLanguage');
    //debugPrint('🔄🔄🔄 TOGGLE LANGUAGE COMPLETED 🔄🔄🔄');
  }

  // Set specific language
  Future<void> setLanguage(String code) async {
    if (code == _languageCode) return;

    //debugPrint('🎯 setLanguage() called with: $code');
    _languageCode = code;
    _setDictionary(_languageCode);
    await Storage.setLanguage(_languageCode);
    notifyListeners();
    //debugPrint('✅ setLanguage() completed');
  }
}
// End Language Provider

// Begin Dialog Handler
class DialogHandler {
  final BuildContext context;
  final Dictionary dictionary;

  DialogHandler(this.context, this.dictionary);

  // Show error message
  void showErrorMessage({
    String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message ?? dictionary.errorDefault,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }

  // Show info message
  void showInfoMessage({
    String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message ?? dictionary.infoDefault,
      backgroundColor: Colors.blue,
      duration: duration,
    );
  }

  // Show success message
  void showSuccessMessage({
    String? message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message ?? dictionary.successDefault,
      backgroundColor: Colors.green,
      duration: duration,
    );
  }

  // Show confirmation dialog
  Future<bool> showConfirmDialog({
    required String message,
    String? title,
    String? confirmText,
    String? cancelText,
    VoidCallback? onYes,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText ?? dictionary.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText ?? dictionary.yes),
          ),
        ],
      ),
    );

    if (result == true && onYes != null) {
      onYes();
    }

    return result ?? false;
  }

  // Show loading indicator
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  // Hide loading indicator
  void hideLoading() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // Private method untuk snackbar
  void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required Duration duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
// End Dialog Handler

// Begin Context Extension
// Extension utama untuk BuildContext
extension ContextExtensions on BuildContext {
  // 1. Theme extension - ambil theme data langsung
  ThemeData get theme => Theme.of(this);

  // 2. Dictionary extension - ambil dictionary dari language provider
  Dictionary get dictionary =>
      Provider.of<LanguageProvider>(this, listen: false).dictionary;

  // 3. Theme mode extension - untuk toggle theme
  String get themeMode =>
      Provider.of<ThemeProvider>(this, listen: false).themeMode;

  // 4. Language code extension
  String get languageCode =>
      Provider.of<LanguageProvider>(this, listen: false).languageCode;

  // 5. Dialog handler dengan context yang sudah ada
  DialogHandler get dialog => DialogHandler(this, dictionary);

  // 6. Shortcut untuk show error message
  void showErrorMessage([String? message]) {
    dialog.showErrorMessage(message: message);
  }

  // 7. Shortcut untuk show info message
  void showInfoMessage([String? message]) {
    dialog.showInfoMessage(message: message);
  }

  // 8. Shortcut untuk show success message
  void showSuccessMessage([String? message]) {
    dialog.showSuccessMessage(message: message);
  }

  // 9. Shortcut untuk show confirmation dialog
  Future<bool> showConfirm(String message, {VoidCallback? onYes}) {
    return dialog.showConfirmDialog(message: message, onYes: onYes);
  }

  // 10. Shortcut untuk show loading
  void showLoading() {
    dialog.showLoading();
  }

  // 11. Shortcut untuk hide loading
  void hideLoading() {
    dialog.hideLoading();
  }

  // 12. Toggle theme method
  Future<void> toggleTheme() async {
    await Provider.of<ThemeProvider>(this, listen: false).toggleTheme();
  }

  // 13. Toggle language method
  Future<void> toggleLanguage() async {
    await Provider.of<LanguageProvider>(this, listen: false).toggleLanguage();
  }
}

// Extension khusus untuk akses dictionary yang lebih spesifik
// Ini opsional, tapi sesuai permintaan kamu untuk context.dictionary.labelUsername
extension DictionaryExtensions on BuildContext {
  // Dictionary dengan akses langsung ke property
  Dictionary get dict => dictionary;

  // Atau kalau mau lebih eksplisit
  Dictionary get kamus => dictionary;
}

// End Context Extension

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

  static Color hoverColor = Colors.grey.withOpacity(0.2);
  static Color highlightColor = Colors.grey.withOpacity(0.4);
  static Color splashColor = Colors.grey.withOpacity(0.6);

  static Color getButtonBackgroundColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xff293331)
      : Color(0xffffffff);
  static Color getButtonBorderColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Colors.grey.shade800
      : Colors.grey.shade400;
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

  static TextStyle getOpenSansTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.openSans(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );

  static TextStyle getBodyTextStyle(ThemeData theme) => getOpenSansTextStyle(
    color: getBodyTextColor(theme),
    fontSize: defaultFontSize,
  );

  static TextStyle getButtonTextStyle(ThemeData theme) => getOpenSansTextStyle(
    color: getBodyTextColor(theme),
    fontSize: defaultFontSize,
  );

  static TextStyle getTextFieldTextStyle(ThemeData theme) =>
      getOpenSansTextStyle(
        color: getBodyTextColor(theme),
        fontSize: defaultFontSize,
      );

  static Border borderAll(Color color) {
    return Border.all(color: color, width: 1);
  }

  static Border borderTop(Color color) {
    return Border(top: BorderSide(width: 1, color: color));
  }

  static Border borderBottom(Color color) {
    return Border(bottom: BorderSide(width: 1, color: color));
  }

  static Border borderTopBottom(Color color) {
    return Border(
      top: BorderSide(width: 1, color: color),
      bottom: BorderSide(width: 1, color: color),
    );
  }

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

  static EdgeInsets paddingBottom({double? value}) {
    return EdgeInsets.only(
      top: 0,
      left: 0,
      right: 0,
      bottom: value ?? defaultPadding,
    );
  }

  static EdgeInsets paddingTop({double? value}) {
    return EdgeInsets.only(
      top: value ?? defaultPadding,
      left: 0,
      right: 0,
      bottom: 0,
    );
  }

  // ============ SIZED BOX HELPERS ============
  static SizedBox spacingVertical({double? height}) {
    return SizedBox(height: height ?? defaultPadding);
  }

  static SizedBox spacingHorizontal({double? width}) {
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
class ButtonPurple extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonPurple({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      disabledColor: Colors.white60,
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
      onHoverBackgroundColor: Colors.black.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.5),
      onSplashBackgroundColor: Colors.black.withOpacity(0.7),
    );
  }
}

class ButtonGreen extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonGreen({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      disabledColor: Colors.white60,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      onHoverBackgroundColor: Colors.black.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.5),
      onSplashBackgroundColor: Colors.black.withOpacity(0.7),
    );
  }
}

class ButtonBlue extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonBlue({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      disabledColor: Colors.white60,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      onHoverBackgroundColor: Colors.black.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.5),
      onSplashBackgroundColor: Colors.black.withOpacity(0.7),
    );
  }
}

class ButtonBlack extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonBlack({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      borderColor: Colors.grey.shade800,
      disabledColor: Colors.white60,
      backgroundColor: Color(0xff293331),
      textColor: Colors.white,
      onHoverBackgroundColor: Colors.grey.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.grey.withOpacity(0.5),
      onSplashBackgroundColor: Colors.grey.withOpacity(0.7),
    );
  }
}

class ButtonWhite extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonWhite({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      disabledColor: Colors.grey,
      borderColor: Colors.grey.shade300,
      backgroundColor: Color(0xfff5f5f5),
      textColor: Color(0xff1F2625),
      onHoverBackgroundColor: Colors.grey.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.grey.withOpacity(0.5),
      onSplashBackgroundColor: Colors.grey.withOpacity(0.7),
    );
  }
}

class ButtonOrange extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool enabled;
  const ButtonOrange({
    this.text,
    this.icon,
    this.fontSize,
    this.onTap,
    this.enabled = true,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Button(
      text: text,
      icon: icon,
      fontSize: fontSize,
      enabled: enabled,
      disabledColor: Colors.white60,
      backgroundColor: Colors.deepOrange,
      textColor: Colors.white,
      onHoverBackgroundColor: Colors.black.withOpacity(0.3),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.5),
      onSplashBackgroundColor: Colors.black.withOpacity(0.7),
    );
  }
}

// Begin Button
class Button extends StatefulWidget {
  final EdgeInsets? padding;
  final String? text;
  final IconData? icon;
  final double? fontSize;
  final String? tooltip;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? onHoverTextColor;
  final Color? onHighlightTextColor;
  final Color? onSplashTextColor;
  final Color? onHoverBackgroundColor;
  final Color? onHighlightBackgroundColor;
  final Color? onSplashBackgroundColor;
  final double? borderRadius;
  final Color? backgroundColor;
  final bool enabled;
  final Color? disabledColor;
  final Color? borderColor;
  const Button({
    this.text,
    this.icon,
    this.textColor,
    this.fontSize,
    this.tooltip,
    this.onTap,
    this.padding,
    this.onHoverTextColor,
    this.onHoverBackgroundColor,
    this.onHighlightTextColor,
    this.onHighlightBackgroundColor,
    this.onSplashTextColor,
    this.onSplashBackgroundColor,
    this.borderRadius,
    this.backgroundColor,
    this.enabled = true,
    this.disabledColor = Colors.grey,
    this.borderColor,
    super.key,
  });
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHover = false;
  bool _isHighlight = false;
  bool _isSplash = false;
  Color _getTextColor(ThemeData theme) {
    return widget.enabled
        ? widget.textColor ?? Constant.getBodyTextColor(theme)
        : widget.disabledColor ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Widget button = Material(
      color:
          widget.backgroundColor ??
          Constant.getButtonBackgroundColor(context.theme),
      borderRadius: BorderRadius.all(
        Radius.circular(widget.borderRadius ?? Constant.defaultBorderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius ?? Constant.defaultBorderRadius),
        ),
        hoverColor: widget.enabled
            ? widget.onHoverBackgroundColor ?? Constant.hoverColor
            : Colors.transparent,
        highlightColor: widget.enabled
            ? widget.onHighlightBackgroundColor ?? Constant.highlightColor
            : Colors.transparent,
        splashColor: widget.enabled
            ? widget.onSplashBackgroundColor ?? Constant.splashColor
            : Colors.transparent,
        radius: Constant.defaultBorderRadius,
        onTap: () {
          if (widget.enabled) if (widget.onTap != null) widget.onTap!();
        },
        onHover: (value) {
          setState(() {
            _isHover = widget.enabled && value;
          });
        },
        onHighlightChanged: (value) {
          setState(() {
            _isHighlight = widget.enabled && value;
          });
        },
        onTapDown: (value) {
          setState(() {
            _isSplash = widget.enabled;
          });
        },
        onTapUp: (value) {
          setState(() {
            _isSplash = false;
          });
        },
        child: Container(
          padding: widget.padding ?? Constant.paddingAll(),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: widget.borderColor != null
                ? Constant.borderAll(widget.borderColor!)
                : widget.backgroundColor == null
                ? Constant.borderAll(
                    Constant.getButtonBorderColor(context.theme),
                  )
                : null,
            borderRadius: BorderRadius.circular(Constant.defaultBorderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null)
                  Icon(
                    widget.icon!,
                    size: widget.fontSize != null
                        ? widget.fontSize! + 7
                        : Constant.defaultFontSize + 7,
                    color: _isHover
                        ? widget.onHoverTextColor ??
                              _getTextColor(context.theme)
                        : _isHighlight
                        ? widget.onHighlightTextColor ??
                              _getTextColor(context.theme)
                        : _isSplash
                        ? widget.onSplashTextColor ??
                              _getTextColor(context.theme)
                        : _getTextColor(context.theme),
                  ),
                if (widget.icon != null && widget.text != null)
                  Constant.spacingHorizontal(),

                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: GoogleFonts.openSans(
                      fontSize: widget.fontSize ?? Constant.defaultFontSize,
                      color: _isHover
                          ? widget.onHoverTextColor ??
                                _getTextColor(context.theme)
                          : _isHighlight
                          ? widget.onHighlightTextColor ??
                                _getTextColor(context.theme)
                          : _isSplash
                          ? widget.onSplashTextColor ??
                                _getTextColor(context.theme)
                          : _getTextColor(context.theme),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      button = Tooltip(
        message: widget.tooltip!,
        triggerMode: TooltipTriggerMode.longPress, // default long press
        verticalOffset: 24,
        child: button,
      );
    }

    return button;
  }
}
// End Button

// Begin Responsive Class
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return desktop;
        }
        if (constraints.maxWidth >= 768 && constraints.maxWidth < 1024) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

// End Responsive Class
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
  String get ok;
  String get cancel;
  String get yes;
  String get no;
  String get delete;
  String get save;
  String get edit;

  // Messages
  String get defaultConfirmationTitle;
  String get confirmationDelete;

  // Auth
  String get username;
  String get password;
  String get oldPassword;
  String get newPassword;
  String get confirmNewPassword;
  String get login;
  String get logout;
  String get changePassword;
  String get profile;
  String get register;
  String get forgotPassword;

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
  String get defaultConfirmationTitle => 'Confirmation';
  @override
  String get confirmationDelete => 'Are you sure you want to delete this item?';
  @override
  String get username => 'Username';
  @override
  String get password => 'Password';
  @override
  String get oldPassword => 'Old Password';
  @override
  String get newPassword => 'New Password';
  @override
  String get confirmNewPassword => 'Confirm New Password';
  @override
  String get login => 'Login';
  @override
  String get logout => 'Logout';
  @override
  String get changePassword => 'Change Password';
  @override
  String get profile => 'Profile';
  @override
  String get register => 'Register';
  @override
  String get forgotPassword => 'Forgot Password';
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
  String get defaultConfirmationTitle => 'Konfirmasi';
  @override
  String get confirmationDelete =>
      'Apakah Anda yakin ingin menghapus data ini?';
  @override
  String get username => 'Nama Pengguna';
  @override
  String get password => 'Kata Sandi';
  @override
  String get oldPassword => 'Kata Sandi Lama';
  @override
  String get newPassword => 'Kata Sandi Baru';
  @override
  String get confirmNewPassword => 'Ulang Kata Sandi Baru';
  @override
  String get login => 'Masuk';
  @override
  String get logout => 'Keluar';
  @override
  String get changePassword => 'Ganti Kata Sandi';
  @override
  String get profile => 'Profil';
  @override
  String get register => 'Daftar';
  @override
  String get forgotPassword => 'Lupa Kata Sandi';
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
  void showErrorMessage(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }

  // Show info message
  void showInfoMessage(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.blue,
      duration: duration,
    );
  }

  // Show success message
  void showSuccessMessage(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      message: message,
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
        title: title != null
            ? Text(title)
            : Text(dictionary.defaultConfirmationTitle),
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
  void showErrorMessage(String message) {
    dialog.showErrorMessage(message);
  }

  // 7. Shortcut untuk show info message
  void showInfoMessage(String message) {
    dialog.showInfoMessage(message);
  }

  // 8. Shortcut untuk show success message
  void showSuccessMessage(String message) {
    dialog.showSuccessMessage(message);
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
}

// End Context Extension

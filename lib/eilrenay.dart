import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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
  static Color getTextBoxTextColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xfff3f5f9)
      : Color(0xff1F2625);
  static Color getTextBoxLabelColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xfff0f0f0)
      : Color(0xff1F2625);
  static Color getTextBoxHintColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Color(0xffe9e9e9)
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
  static Color getTextBoxBorderColor(ThemeData theme) =>
      theme.brightness == Brightness.dark
      ? Colors.grey.shade800
      : Colors.grey.shade400;

  static TextStyle getBodyTextStyle(ThemeData theme) => getOpenSansTextStyle(
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
      onHoverBackgroundColor: Colors.black.withOpacity(0.2),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.4),
      onSplashBackgroundColor: Colors.black.withOpacity(0.6),
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
      onHoverBackgroundColor: Colors.black.withOpacity(0.2),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.4),
      onSplashBackgroundColor: Colors.black.withOpacity(0.6),
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
      onHoverBackgroundColor: Colors.black.withOpacity(0.2),
      onHighlightBackgroundColor: Colors.black.withOpacity(0.4),
      onSplashBackgroundColor: Colors.black.withOpacity(0.6),
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

// Begin TextBox - With Proper Spacing
class TextBox extends StatefulWidget {
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final double? width;
  final String? value;
  final int? maxLength;
  final int? maxLines;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final bool showClearButton;
  final VoidCallback? onTap;

  const TextBox({
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.width,
    this.value,
    this.maxLength,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.showClearButton = false,
    this.obscureText = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.onTap,
    super.key,
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasText = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;

    if (widget.value != null && _controller.text.isEmpty) {
      _controller.text = widget.value!;
    }

    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_updateHasText);
  }

  @override
  void didUpdateWidget(TextBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
    if (widget.value != oldWidget.value && widget.value != null) {
      _controller.text = widget.value!;
    }
    if (widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateHasText);
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _updateHasText() {
    if (mounted && _hasText != _controller.text.isNotEmpty) {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    }
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build suffix icons
    List<Widget> suffixIcons = [];

    // Add clear button if needed
    if (widget.showClearButton &&
        _hasText &&
        widget.enabled &&
        !widget.readOnly) {
      suffixIcons.add(
        IconButton(
          icon: Icon(Icons.close, size: Constant.defaultFontSize + 7),
          onPressed: () {
            _controller.clear();
            if (widget.onChanged != null) {
              widget.onChanged!('');
            }
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      );
    }

    // Add visibility toggle if obscureText is enabled
    if (widget.obscureText && widget.enabled && !widget.readOnly) {
      suffixIcons.add(
        IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: Constant.defaultFontSize + 7,
          ),
          onPressed: _toggleObscureText,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      );
    }

    // Add spacing at the end if there are icons
    Widget? suffixIconWidget;
    if (suffixIcons.isNotEmpty) {
      suffixIconWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...suffixIcons,
          SizedBox(width: Constant.defaultPadding), // Add spacing from border
        ],
      );
    } else if (widget.suffixIcon != null) {
      suffixIconWidget = Padding(
        padding: const EdgeInsets.only(right: Constant.defaultPadding),
        child: Icon(widget.suffixIcon, size: Constant.defaultFontSize + 7),
      );
    }

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      style: GoogleFonts.openSans(
        color: widget.enabled
            ? Constant.getTextBoxTextColor(context.theme)
            : Colors.grey,
        fontSize: Constant.defaultFontSize,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, size: Constant.defaultFontSize + 7)
            : null,
        suffixIcon: suffixIconWidget,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.openSans(
          color: widget.enabled
              ? Constant.getTextBoxLabelColor(context.theme)
              : Colors.grey,
          fontSize: Constant.defaultFontSize,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.openSans(
          color: widget.enabled
              ? Constant.getTextBoxHintColor(context.theme)
              : Colors.grey,
          fontSize: Constant.defaultFontSize,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Constant.defaultBorderRadius),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Constant.getTextBoxBorderColor(context.theme),
          ),
        ),
        constraints: BoxConstraints(maxWidth: widget.width ?? double.infinity),
      ),
    );
  }
}

// End TextBox
// Begin TextBox Date - With Format Parameter
class TextBoxDate extends StatefulWidget {
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final double? width;
  final String? value;
  final int? maxLength;
  final int? maxLines;
  final Function(String)? onChanged;
  final String dateFormat; // Format parameter

  const TextBoxDate({
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.width,
    this.value,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.dateFormat = 'dd/MM/yyyy', // Default format
    super.key,
  });

  @override
  State<TextBoxDate> createState() => _TextBoxDateState();
}

class _TextBoxDateState extends State<TextBoxDate> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late DateFormat _dateFormatter;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    // Initialize date formatter dengan locale EN (default)
    _dateFormatter = DateFormat(widget.dateFormat, 'en_US');

    if (widget.value != null && _controller.text.isEmpty) {
      _controller.text = widget.value!;
    }
  }

  @override
  void didUpdateWidget(TextBoxDate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
    if (widget.value != oldWidget.value && widget.value != null) {
      _controller.text = widget.value!;
    }
    // Update formatter if format changed
    if (widget.dateFormat != oldWidget.dateFormat) {
      _dateFormatter = DateFormat(widget.dateFormat, 'en_US');
      // Re-format existing date if any
      if (_controller.text.isNotEmpty) {
        try {
          // Try to parse with old format first
          DateFormat oldFormatter = DateFormat(oldWidget.dateFormat, 'en_US');
          DateTime date = oldFormatter.parse(_controller.text);
          _controller.text = _dateFormatter.format(date);
        } catch (e) {
          // If parsing fails, try to parse with current format
          try {
            DateTime date = _dateFormatter.parse(_controller.text);
            _controller.text = _dateFormatter.format(date);
          } catch (e2) {
            // Keep existing text
          }
        }
      }
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _showDatePicker() async {
    if (!widget.enabled) return;

    DateTime? initialDate;
    if (_controller.text.isNotEmpty) {
      try {
        // Try to parse with current formatter
        initialDate = _dateFormatter.parse(_controller.text);
      } catch (e) {
        // Try alternative formats
        try {
          // Try dd/MM/yyyy format
          DateFormat altFormatter = DateFormat('dd/MM/yyyy', 'en_US');
          initialDate = altFormatter.parse(_controller.text);
        } catch (e2) {
          try {
            // Try yyyy-MM-dd format
            DateFormat altFormatter2 = DateFormat('yyyy-MM-dd', 'en_US');
            initialDate = altFormatter2.parse(_controller.text);
          } catch (e3) {
            initialDate = DateTime.now();
          }
        }
      }
    } else {
      initialDate = DateTime.now();
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('en', 'US'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = _dateFormatter.format(picked);
      _controller.text = formattedDate;
      if (widget.onChanged != null) {
        widget.onChanged!(formattedDate);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextBox(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      readOnly: true,
      enabled: widget.enabled,
      onTap: _showDatePicker,
      prefixIcon: Icons.calendar_today,
      labelText: widget.labelText,
      hintText: widget.hintText ?? widget.dateFormat.toLowerCase(),
      width: widget.width,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      showClearButton: true,
    );
  }
}
// End TextBox Date

// Begin TextBox Number - Fixed with Decimal Separator Handling
class TextBoxNumber extends StatefulWidget {
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final double? width;
  final String? value;
  final int? maxLength;
  final Function(String)? onChanged;
  final bool showClearButton;
  final int decimalPlaces;
  final bool useThousandSeparator;

  const TextBoxNumber({
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.width,
    this.value,
    this.maxLength,
    this.onChanged,
    this.showClearButton = true,
    this.decimalPlaces = 0,
    this.useThousandSeparator = true,
    super.key,
  });

  @override
  State<TextBoxNumber> createState() => _TextBoxNumberState();
}

class _TextBoxNumberState extends State<TextBoxNumber> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasText = false;
  bool _isFormatting = false;
  bool _isDecimalPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    if (widget.value != null && _controller.text.isEmpty) {
      _controller.text = widget.value!;
    }

    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(TextBoxNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
    if (widget.value != oldWidget.value && widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  int _calculateCursorPosition(
    String oldText,
    String newText,
    int oldCursorPos,
    bool isDecimalPressed,
  ) {
    if (oldCursorPos < 0 || oldCursorPos > oldText.length) {
      return newText.length;
    }

    // If decimal was pressed, find position after decimal point
    if (isDecimalPressed && widget.decimalPlaces > 0) {
      int decimalIndex = newText.indexOf('.');
      if (decimalIndex != -1) {
        return decimalIndex + 1;
      }
    }

    // Get the raw number part before cursor
    String beforeCursor = oldText.substring(0, oldCursorPos);

    // Extract only digits from before cursor
    String digitsBeforeCursor = '';
    for (int i = 0; i < beforeCursor.length; i++) {
      String char = beforeCursor[i];
      if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
        digitsBeforeCursor += char;
      }
    }

    // Count digits in the new text
    int digitCount = 0;
    int newCursorPos = 0;

    for (int i = 0; i < newText.length; i++) {
      String char = newText[i];
      if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
        digitCount++;
        if (digitCount == digitsBeforeCursor.length) {
          newCursorPos = i + 1;
          break;
        }
      }
    }

    // If not found, put cursor at the end
    if (newCursorPos == 0) {
      newCursorPos = newText.length;
    }

    return newCursorPos.clamp(0, newText.length);
  }

  void _onTextChanged() {
    if (_isFormatting) return;

    String text = _controller.text;
    int oldCursorPos = _controller.selection.baseOffset;

    // Check if decimal was just pressed
    _isDecimalPressed = false;
    if (text.isNotEmpty && oldCursorPos > 0) {
      String lastChar = text[oldCursorPos - 1];
      if (lastChar == '.') {
        _isDecimalPressed = true;
      }
    }

    if (text.isEmpty) {
      if (_hasText) {
        setState(() {
          _hasText = false;
        });
      }
      if (widget.onChanged != null) {
        widget.onChanged!('');
      }
      return;
    }

    setState(() {
      _hasText = true;
    });

    // Extract only numbers and decimal point
    String rawNumber = '';
    bool hasDecimal = false;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char.codeUnitAt(0) >= 48 && char.codeUnitAt(0) <= 57) {
        rawNumber += char;
      } else if (char == '.' && !hasDecimal && widget.decimalPlaces > 0) {
        rawNumber += char;
        hasDecimal = true;
      }
    }

    if (rawNumber.isEmpty) {
      _controller.text = '';
      if (widget.onChanged != null) {
        widget.onChanged!('');
      }
      return;
    }

    // Parse the number
    num? number;
    if (rawNumber.contains('.')) {
      number = num.tryParse(rawNumber);
    } else {
      number = int.tryParse(rawNumber);
    }

    if (number != null) {
      // Format the number
      String formatted = _formatNumber(number);

      if (formatted != text) {
        // Calculate new cursor position
        int newCursorPos = _calculateCursorPosition(
          text,
          formatted,
          oldCursorPos,
          _isDecimalPressed,
        );

        _isFormatting = true;
        _controller.text = formatted;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: newCursorPos),
        );
        _isFormatting = false;
      } else if (_isDecimalPressed) {
        // If text didn't change but decimal was pressed (already has decimal)
        // Move cursor after decimal point
        int decimalIndex = formatted.indexOf('.');
        if (decimalIndex != -1 && decimalIndex + 1 < formatted.length) {
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: decimalIndex + 1),
          );
        }
      }

      if (widget.onChanged != null) {
        widget.onChanged!(formatted);
      }
    }
  }

  String _formatNumber(num number) {
    String result;

    if (widget.decimalPlaces > 0) {
      // Format with decimal places
      double doubleValue = number.toDouble();
      result = doubleValue.toStringAsFixed(widget.decimalPlaces);
    } else {
      // Integer
      result = number.toString();
    }

    // Add thousand separators if needed
    if (widget.useThousandSeparator) {
      List<String> parts = result.split('.');
      String integerPart = _addThousandSeparator(parts[0]);

      if (parts.length > 1) {
        return '$integerPart.${parts[1]}';
      }
      return integerPart;
    }

    return result;
  }

  String _addThousandSeparator(String number) {
    String result = '';
    int count = 0;

    for (int i = number.length - 1; i >= 0; i--) {
      result = number[i] + result;
      count++;
      if (count % 3 == 0 && i != 0) {
        result = ',' + result;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextBox(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      keyboardType: TextInputType.numberWithOptions(
        decimal: widget.decimalPlaces > 0,
      ),
      textAlign: TextAlign.right,
      maxLength: widget.maxLength,
    );
  }
}

// End TextBox Number
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

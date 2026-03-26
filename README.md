Eilrenay

A comprehensive Flutter package that provides theme management, multi-language support, dialog handlers, and responsive utilities with simple context extensions. Perfect for building apps with dynamic theming and internationalization out of the box.

## Features
🌓 Dynamic Theme Management - Toggle between light/dark mode with persistent storage

🌐 Multi-Language Support - Built-in English and Indonesian dictionaries, easily extendable

💬 Simple Dialog System - One-liner calls for error, info, success, confirm, and loading dialogs

🎨 Context Extensions - Access everything via context.theme, context.dictionary, context.showErrorMessage(), etc.

💾 Persistent Preferences - Theme and language preferences saved with SharedPreferences

📱 Responsive Helpers - Detect mobile, tablet, or desktop screens

🎯 Ready-to-Use UI Components - Pre-built Box widget with automatic theming

🔧 Zero Boilerplate - No need to manually manage providers in every widget
## Getting Started
Prerequisites
Flutter SDK (>=3.0.0)

Dart (>=3.0.0)

## Installation
pubspec.yaml
```yaml
dependencies:
  eilrenay: ^1.0.0
  provider: ^6.1.1
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0
```
## Setup Awal
main.dart
```dart
import 'package:eilrenay/eilrenay.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return MaterialApp(
            title: languageProvider.dictionary.appName,
            theme: Constant.getTheme(themeProvider.themeMode),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
```
## Cara Pakai

1. Theme
```dart
// Ambil theme
ThemeData theme = context.theme;

// Toggle theme
await context.toggleTheme();

// Cek mode sekarang
String mode = context.themeMode; // 'light' atau 'dark'
```
2. Dictionary (Multi-language)
```dart
// Ambil text
String username = context.dictionary.username;
String confirm = context.dictionary.confirmationDelete;
String appName = context.dictionary.appName;

// Toggle bahasa
await context.toggleLanguage();

// Cek bahasa sekarang
String lang = context.languageCode; // 'en' atau 'id'
```
3. Dialog
```dart
// Pesan
context.showErrorMessage('Error!');
context.showInfoMessage('Info!');
context.showSuccessMessage('Sukses!');

// Konfirmasi
await context.showConfirm('Yakin?', onYes: () {
  // action
});

// Loading
context.showLoading();
await proses();
context.hideLoading();
```
4. Responsive
```dart
if (context.isMobile) {
  // HP
} else if (context.isTablet) {
  // Tablet
} else if (context.isDesktop) {
  // Desktop
}
```
5. Widget Box
```dart
Box(
  padding: Constant.paddingAll(),
  child: Text('Content'),
)
```
6. Constant helper
```dart
// Padding
Constant.paddingAll()           // all 10
Constant.paddingVertical()      // vertical 10
Constant.paddingHorizontal()    // horizontal 10

// Spacing
Constant.spacingVertical()      // height 10
Constant.spacingHorizontal()    // width 10

// Text style
Constant.getBodyTextStyle(context)
Constant.getButtonTextStyle(context)
```
Contoh Lengkap
main.dart
```dart
import 'package:flutter/material.dart';
import 'package:eilrenay/eilrenay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //debugPrint('🚀 APP STARTED');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint('🏠 MyApp BUILD called');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            //debugPrint('📦 ThemeProvider CREATED');
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            //debugPrint('📦 LanguageProvider CREATED');
            return LanguageProvider();
          },
        ),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          //debugPrint('🔄 Consumer2 REBUILD - Theme: ${themeProvider.themeMode}, Language: ${languageProvider.languageCode}',);
          //debugPrint('   Dictionary type: ${languageProvider.dictionary.runtimeType}',);
          //debugPrint('   App Name: ${languageProvider.dictionary.appName}');

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: languageProvider.dictionary.appName,
            theme: Constant.getTheme(themeProvider.themeMode),
            home: const HomePage(),
            // 🔥 KUNCI: Ini memastikan semua child bisa akses provider
            builder: (context, child) {
              return child ?? const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
```
home_page.dart
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    //debugPrint('🏠 HomePage createState');
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //debugPrint('🔧 _HomePageState initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //debugPrint('🔄 _HomePageState didChangeDependencies - Language: ${context.languageCode}',);
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint('🎨 _HomePageState BUILD - Language: ${context.languageCode}, Dictionary: ${context.dictionary.runtimeType}',);

    // 🔥 INI YANG KAMU MAU! 🔥
    ThemeData theme = context.theme;
    String usernameLabel = context.dictionary.username;
    String passwordLabel = context.dictionary.password;

    //debugPrint('   Username label: $usernameLabel');
    //debugPrint('   Password label: $passwordLabel');

    return Scaffold(
      appBar: AppBar(
        title: Text(context.dictionary.appName),
        actions: [
          // Tombol toggle language
          IconButton(
            icon: Text(context.languageCode.toUpperCase()),
            onPressed: () async {
              //debugPrint('🔘 LANGUAGE BUTTON PRESSED');
              //debugPrint('   Before toggle - Language: ${context.languageCode}',);

              await context.toggleLanguage();

              //debugPrint('   After toggle - Language: ${context.languageCode}');
              //debugPrint('   Dictionary type: ${context.dictionary.runtimeType}',);

              // 🔥 FORCE REBUILD dengan setState
              // Ini penting karena context.dictionary di build perlu di-refresh
              setState(() {});

              context.showSuccessMessage(
                'Language changed to ${context.languageCode.toUpperCase()}',
              );
            },
          ),
          // Tombol toggle theme
          IconButton(
            icon: Icon(
              context.themeMode == 'light' ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () async {
              //debugPrint('🔘 THEME BUTTON PRESSED');
              //debugPrint('   Before toggle - Theme: ${context.themeMode}');

              await context.toggleTheme();

              //debugPrint('   After toggle - Theme: ${context.themeMode}');

              // 🔥 Theme akan otomatis rebuild karena Consumer2
              context.showSuccessMessage(
                'Theme changed to ${context.themeMode}',
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contoh penggunaan dictionary dengan value dari provider
            TextField(
              decoration: InputDecoration(
                labelText: context.dictionary.username,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: context.dictionary.password,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            // Menampilkan current language untuk testing
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey.shade200,
              child: Text(
                'Current Language: ${context.languageCode.toUpperCase()} - Dictionary: ${context.dictionary.runtimeType}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //debugPrint('🔘 ERROR BUTTON PRESSED');
                context.showErrorMessage('This is an error message');
              },
              child: Text(context.dictionary.login),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //debugPrint('🔘 INFO BUTTON PRESSED');
                context.showInfoMessage('This is info message');
              },
              child: const Text('Show Info'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                //debugPrint('🔘 SUCCESS BUTTON PRESSED');
                context.showSuccessMessage('Operation successful!');
              },
              child: const Text('Show Success'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                //debugPrint('🔘 DELETE BUTTON PRESSED');
                bool confirmed = await context.showConfirm(
                  context.dictionary.confirmationDelete,
                  onYes: () {
                    //debugPrint('✅ User CONFIRMED deletion');
                    context.showSuccessMessage('Item deleted!');
                  },
                );

                if (confirmed) {
                  //debugPrint('User confirmed deletion');
                } else {
                  //debugPrint('User cancelled');
                }
              },
              child: const Text('Delete Item'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                //debugPrint('🔘 LOADING BUTTON PRESSED');
                context.showLoading();
                //debugPrint('⏳ Loading shown');

                await Future.delayed(const Duration(seconds: 2));
                //debugPrint('⏰ Delay completed');

                context.hideLoading();
                //debugPrint('✅ Loading hidden');
                context.showSuccessMessage('Process completed!');
              },
              child: const Text('Process with Loading'),
            ),
          ],
        ),
      ),
    );
  }
}

```
## Menambah Text Dictionary
```dart
abstract class Dictionary {
  // ... yang sudah ada
  String get newText;
}
```
1. Tambah di DictionaryEn
```dart
class DictionaryEn implements Dictionary {
  // ... yang sudah ada
  @override
  String get newText => 'New Text';
}
```
2. Tambah di DictionaryId
```dart
class DictionaryId implements Dictionary {
  // ... yang sudah ada
  @override
  String get newText => 'Teks Baru';
}
```
Cara Pakai:
```dart
context.dictionary.newText
```

## Menambah Bahasa baru
```dart
class DictionaryJp implements Dictionary {
  @override
  String get appName => '私のアプリ';
  @override
  String get ok => 'OK';
  @override
  String get cancel => 'キャンセル';
  // ... implement semua getter
}
```
Update LanguageProvider
```dart
void _setDictionary(String code) {
  switch (code) {
    case 'id':
      _dictionary = DictionaryId();
      break;
    case 'jp':  // tambah ini
      _dictionary = DictionaryJp();
      break;
    default:
      _dictionary = DictionaryEn();
      break;
  }
}
```

## Quick Reference
Yang Mau Dilakukan	Cara
Ambil theme	
```dart
context.theme
```
Ganti theme	
```dart 
await context.toggleTheme()
```
Ambil text
```dart
context.dictionary.username
```
Ganti bahasa	
```dart
await context.toggleLanguage()
```
Error message	
```dart
context.showErrorMessage('msg')
```
Info message	
```dart
context.showInfoMessage('msg')
```
Success message	
```dart
context.showSuccessMessage('msg')
```
Confirm dialog	
```dart
await context.showConfirm('msg')
```
Loading	
```dart
context.showLoading() / context.hideLoading()
```
Cek device	
```dart
context.isMobile, isTablet, isDesktop
```
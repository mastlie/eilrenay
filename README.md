# eilrenay

**Flutter Helper Library** – Memudahkan manajemen tema, multi-bahasa, dan dialog dengan context extensions.

[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
---

## 📖 Bahasa / Language

- [🇮🇩 Bahasa Indonesia](#-indonesian-docs)
- [🇬🇧 English](#-english-docs)

---
## EN English Docs
## ✨ Features
🌓 Theme – Light/dark mode with persistent storage

🌐 Multi-language – Built-in English & Indonesian, easily extendable

💬 Dialog – One-liner for error, info, success, confirm, loading

🎯 Context Extensions – Access everything via context.

📱 Responsive – Detect mobile/tablet/desktop

🎨 Ready Components – Pre-built Box widget

## 📦 Installation
***pubspec.yaml***
```yaml
dependencies:
  eilrenay: ^0.0.1
  provider: ^6.1.1
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0
```
## 🚀 Initial Setup
***main.dart***
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
## 📖 Usage
### 1. Theme
```dart
// Get theme
ThemeData theme = context.theme;

// Toggle theme
await context.toggleTheme();

// Check current mode
String mode = context.themeMode; // 'light' or 'dark'
```
### 2. Dictionary
```dart
// Get text
String username = context.dictionary.username;
String confirm = context.dictionary.confirmationDelete;

// Toggle language
await context.toggleLanguage();

// Check current language
String lang = context.languageCode; // 'en' or 'id'
```
### 3. Dialog
```dart
// Messages
context.showErrorMessage('Error!');
context.showInfoMessage('Info!');
context.showSuccessMessage('Success!');

// Confirmation
await context.showConfirm('Are you sure?', onYes: () {
  // action
});

// Loading
context.showLoading();
await process();
context.hideLoading();
```
### 4. Responsive
```dart
if (context.isMobile) {
  // Mobile layout
} else if (context.isTablet) {
  // Tablet layout
} else if (context.isDesktop) {
  // Desktop layout
}
```
### 5. Box Widget
```dart
Box(
  padding: Constant.paddingAll(),
  child: Text('Content'),
)
```
### 6. Constant Helper
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
## 🎯 Complete Example
**home_page.dart**
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    String usernameLabel = context.dictionary.username;
    String passwordLabel = context.dictionary.password;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.dictionary.appName),
        actions: [
          // Tombol toggle language
          IconButton(
            icon: Text(context.languageCode.toUpperCase()),
            onPressed: () async {

              await context.toggleLanguage();

              setState(() {});

              context.showSuccessMessage(
                'Language changed to ${context.languageCode.toUpperCase()}',
              );
            },
          ),

          IconButton(
            icon: Icon(
              context.themeMode == 'light' ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () async {
              await context.toggleTheme();

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
                context.showErrorMessage('This is an error message');
              },
              child: Text(
                context.dictionary.login,
                style: Constant.getButtonTextStyle(theme),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {                
                context.showInfoMessage('This is info message');
              },
              child: const Text('Show Info'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.showSuccessMessage('Operation successful!');
              },
              child: const Text('Show Success'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                bool confirmed = await context.showConfirm(
                  context.dictionary.confirmationDelete,
                  onYes: () {                    
                    context.showSuccessMessage('Item deleted!');
                  },
                );

                if (confirmed) {
                  
                } else {
                  
                }
              },
              child: const Text('Delete Item'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {                
                context.showLoading();                
                await Future.delayed(const Duration(seconds: 2));                
                context.hideLoading();                
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
## 📝 Adding Dictionary Text
### 1. Add to dictionary.dart:
```dart
abstract class Dictionary {
  // ... existing getters
  String get newText;
}
```
### 2. Add to dictionary_en.dart:
```dart
class DictionaryEn implements Dictionary {
  // ... existing getters
  @override
  String get newText => 'New Text';
}
```
### 3. Add to dictionary_id.dart:
```dart
class DictionaryId implements Dictionary {
  // ... existing getters
  @override
  String get newText => 'Teks Baru';
}
```
### 4. Usage:
```dart
context.dictionary.newText
```
## 🌍 Adding New Language
### 1. Create dictionary_jp.dart:
```dart
class DictionaryJp implements Dictionary {
  @override
  String get appName => '私のアプリ';
  @override
  String get ok => 'OK';
  @override
  String get cancel => 'キャンセル';
  // ... implement all getters
}
```
### 2. Update language_provider.dart:
```dart
void _setDictionary(String code) {
  switch (code) {
    case 'id':
      _dictionary = DictionaryId();
      break;
    case 'jp':  // add this
      _dictionary = DictionaryJp();
      break;
    default:
      _dictionary = DictionaryEn();
      break;
  }
}
```
---

## ⚡️ Quick Reference

| What You Want | How To |
|---|---|
| Get theme | `context.theme` |
| Toggle theme | `await context.toggleTheme()` |
| Get text | `context.dictionary.username` |
| Toggle language | `await context.toggleLanguage()` |
| Error message | `context.showErrorMessage('msg')` |
| Info message | `context.showInfoMessage('msg')` |
| Success message | `context.showSuccessMessage('msg')` |
| Confirm dialog | `await context.showConfirm('msg')` |
| Loading | `context.showLoading()` / `context.hideLoading()` |
| Check device | `context.isMobile`, `isTablet`, `isDesktop` |

---

## 📄 License
MIT License – feel free to use in personal and commercial projects.

## 👤 Author
mastlie

## 🇮🇩 Indonesian Docs

### ✨ Fitur

- 🌓 **Theme** – Light/dark mode, tersimpan otomatis
- 🌐 **Multi-language** – English & Indonesia, mudah ditambah
- 💬 **Dialog** – Error, info, success, confirm, loading tinggal panggil
- 🎯 **Context Extensions** – Akses semua dengan `context.`
- 📱 **Responsive** – Deteksi mobile/tablet/desktop
- 🎨 **Ready Components** – Widget `Box` siap pakai

### 📦 Instalasi

**pubspec.yaml**
```yaml
dependencies:
  eilrenay: ^0.0.1
  provider: ^6.1.1
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0
```
## 🚀 Setup Awal
**main.dart**
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
## 📖 Cara Pakai
### 1. Theme
```dart
// Ambil theme
ThemeData theme = context.theme;

// Toggle theme
await context.toggleTheme();

// Cek mode sekarang
String mode = context.themeMode; // 'light' atau 'dark'
```
### 2. Dictionary (Multi-language)
```dart
// Ambil text
String username = context.dictionary.username;
String confirm = context.dictionary.confirmationDelete;

// Toggle bahasa
await context.toggleLanguage();

// Cek bahasa sekarang
String lang = context.languageCode; // 'en' atau 'id'
```
### 3. Dialog
```dart
// Pesan singkat
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
### 4. Responsive
```dart
if (context.isMobile) {
  // HP
} else if (context.isTablet) {
  // Tablet
} else if (context.isDesktop) {
  // Desktop
}
```
### 5. Widget Box
```dart
Box(
  padding: Constant.paddingAll(),
  child: Text('Content'),
)
```
### 6. Constant Helper
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
## 🎯 Contoh Lengkap
**home_page.dart**
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = context.theme;
    String usernameLabel = context.dictionary.username;
    String passwordLabel = context.dictionary.password;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.dictionary.appName),
        actions: [
          // Tombol toggle language
          IconButton(
            icon: Text(context.languageCode.toUpperCase()),
            onPressed: () async {

              await context.toggleLanguage();

              setState(() {});

              context.showSuccessMessage(
                'Language changed to ${context.languageCode.toUpperCase()}',
              );
            },
          ),

          IconButton(
            icon: Icon(
              context.themeMode == 'light' ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () async {
              await context.toggleTheme();

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
                context.showErrorMessage('This is an error message');
              },
              child: Text(
                context.dictionary.login,
                style: Constant.getButtonTextStyle(theme),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {                
                context.showInfoMessage('This is info message');
              },
              child: const Text('Show Info'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.showSuccessMessage('Operation successful!');
              },
              child: const Text('Show Success'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                bool confirmed = await context.showConfirm(
                  context.dictionary.confirmationDelete,
                  onYes: () {                    
                    context.showSuccessMessage('Item deleted!');
                  },
                );

                if (confirmed) {
                  
                } else {
                  
                }
              },
              child: const Text('Delete Item'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {                
                context.showLoading();                
                await Future.delayed(const Duration(seconds: 2));                
                context.hideLoading();                
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
## 📝 Menambah Text Dictionary
### 1. Tambah di dictionary.dart:
```dart
abstract class Dictionary {
  // ... yang sudah ada
  String get newText;
}
```
### 2. Tambah di dictionary_en.dart:
```dart
class DictionaryEn implements Dictionary {
  // ... yang sudah ada
  @override
  String get newText => 'New Text';
}
```
### 3. Tambah di dictionary_id.dart:
```dart
class DictionaryId implements Dictionary {
  // ... yang sudah ada
  @override
  String get newText => 'Teks Baru';
}
```
### 4. Cara pakai:
```dart
context.dictionary.newText
```
## 🌍 Menambah Bahasa Baru
### 1. Buat file dictionary_jp.dart:
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
### 2. Update language_provider.dart:
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
---

## ⚡️ Quick Reference

| Yang Mau Dilakukan | Cara |
|---|---|
| Ambil theme | `context.theme` |
| Ganti theme | `await context.toggleTheme()` |
| Ambil text | `context.dictionary.username` |
| Ganti bahasa | `await context.toggleLanguage()` |
| Error message | `context.showErrorMessage('msg')` |
| Info message | `context.showInfoMessage('msg')` |
| Success message | `context.showSuccessMessage('msg')` |
| Confirm dialog | `await context.showConfirm('msg')` |
| Loading | `context.showLoading()` / `context.hideLoading()` |
| Cek device | `context.isMobile`, `isTablet`, `isDesktop` |

---


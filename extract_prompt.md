# PROJECT EXTRACTION — TO'LIQ

Bu promptni bajarganda BIRORTA ham faylni qisqartirma. "Yuqorida keltirilgan", "..." ishlatma. Har bir faylning BUTUN mazmunini yoz.

Natijani bitta `project_extraction.md` faylga yoz.

---

## MUHIM QOIDALAR:
- Generated fayllarni HAM yoz (`.gen.dart`, `generated/` ichidagilari)
- AGENTS.md va CLAUDE.md ning TO'LIQ mazmunini yoz (qisqartirma!)
- .cursorrules faylini TO'LIQ yoz
- Binary fayllarni (png, jpg, ttf, otf, vec, svg) FAQAT yo'llarini yoz, mazmunini emas
- Har bir matnli faylning BUTUN kodini yoz

---

## 1. PUBSPEC.YAML
```
[pubspec.yaml ning to'liq mazmuni]
```

## 2. LIB/ DARAXT STRUKTURASI
Terminalda:
```bash
find lib/ -type f | sort
```

## 3. ROOT FAYLLAR — har birini to'liq yoz:
- analysis_options.yaml
- .gitignore
- Makefile
- l10n.yaml
- .fvmrc
- .cursorrules
- AGENTS.md (TO'LIQ — qisqartirma!)
- CLAUDE.md (TO'LIQ — qisqartirma!)
- flutter_launcher_icons.yaml
- flutter_native_splash.yaml
- devtools_options.yaml
- README.md

## 4. CONFIG PAPKASI
Har bir json faylni to'liq yoz:
- config/development.json
- config/staging.json
- config/production.json

## 5. TOOLS PAPKASI
Har bir faylni to'liq yoz:
- tools/dart/vector_generator.dart
- tools/makefile/deploy.mk
- tools/makefile/fire.mk
- tools/makefile/git.mk
- tools/makefile/pub.mk
- tools/script/android-settings.sh

## 6. PACKAGE — local_source
Har bir dart faylni to'liq yoz. Avval struktura:
```bash
find package/ -type f | sort
```
Keyin har bir .dart va .yaml faylning to'liq mazmuni.

## 7. LIB/ ICHIDAGI BARCHA DART FAYLLAR
**Generated fayllarni ham yoz!** Har bir .dart faylni to'liq yoz.
Format:
### lib/path/to/file.dart
```dart
[to'liq mazmun]
```

## 8. TEST PAPKASI
```bash
find test/ -type f | sort
```
Har bir test faylning to'liq mazmuni.

## 9. ASSETS STRUKTURASI (faqat yo'llar)
```bash
find assets/ -type f | sort
```

## 10. ANDROID + iOS PACKAGE NAME
```bash
grep -r "applicationId\|namespace" android/app/build.gradle.kts
grep -r "PRODUCT_BUNDLE_IDENTIFIER" ios/Runner.xcodeproj/project.pbxproj | head -5
cat android/app/src/main/kotlin/*/MainActivity.kt 2>/dev/null || find android/ -name "MainActivity.kt" -exec cat {} \;
```

## 11. .VSCODE PAPKASI
```bash
find .vscode/ -type f | sort
```
Har bir fayl mazmunini yoz.

## 12. FLUTTER VERSION
```bash
flutter --version
dart --version
cat .fvmrc
```

---

**ESLATMA:** Agar fayl juda katta bo'lsa HAM qisqartirma. Butun mazmunini yoz. Bu ma'lumotlar Mason brick va AI rules yaratish uchun ishlatiladi — to'liq bo'lmasa natija noto'g'ri chiqadi.

# google_mlkit_text_recognition references every script recognizer from its
# TextRecognizer.initialize() switch, but only the Latin bundle is on the
# classpath (see CardScannerDataSourceImpl, which builds TextRecognizer(script: .latin)).
# The other options classes are never reached at runtime, so suppress R8's
# missing-class errors for them.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**

part of 'extensions.dart';

extension ContextExt on BuildContext {
  // ── Theme ───────────────────────────────────────────────────────────

  ThemeData get theme => Theme.of(this);

  ThemeColors get color => theme.extension<ThemeColors>()!;

  ThemeColors get colors => theme.appColors;

  ColorScheme get colorScheme => theme.colorScheme;

  ThemeTextStyles get textTheme => theme.appTextStyles;

  ThemeTextStyles get textStyles => theme.appTextStyles;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  LocalSource get localSource => sl<LocalSource>();

  bool get isDark => theme.brightness == .dark;

  // ── MediaQuery ──────────────────────────────────────────────────────

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get height => screenSize.height;

  double get width => screenSize.width;

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  EdgeInsets get viewPadding => mediaQuery.viewPadding;

  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  bool get isKeyboardOpen => viewInsets.bottom > 0;

  Orientation get orientation => mediaQuery.orientation;

  // ── Platform ────────────────────────────────────────────────────────

  TargetPlatform get platform => theme.platform;

  bool get isIOS => platform == .iOS;

  bool get isAndroid => platform == .android;

  // ── Localization ────────────────────────────────────────────────────

  Locale get locale => Localizations.localeOf(this);

  // ── Focus ───────────────────────────────────────────────────────────

  void hideKeyboard() => FocusScope.of(this).unfocus();

  bool get hasFocus => FocusScope.of(this).hasFocus;

  void requestFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);

  // ── Navigation ──────────────────────────────────────────────────────

  NavigatorState get navigator => Navigator.of(this);

  bool get canPop => navigator.canPop();

  void pop<T>([T? result]) => navigator.pop(result);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      navigator.pushNamed<T>(routeName, arguments: arguments);

  // ── ScaffoldMessenger ───────────────────────────────────────────────

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    SnackBarBehavior behavior = .floating,
  }) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), duration: duration, action: action, behavior: behavior));
  }

  void showErrorSnackBar(String message) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: colorScheme.error, behavior: .floating));
  }

  void showSuccessSnackBar(String message) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: color.success, behavior: .floating));
  }

  // ── Dialogs / Sheets ────────────────────────────────────────────────

  Future<T?> showAppDialog<T>({required WidgetBuilder builder, bool barrierDismissible = true}) =>
      showDialog<T>(context: this, builder: builder, barrierDismissible: barrierDismissible);

  Future<T?> showAppBottomSheet<T>({
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) => showModalBottomSheet<T>(
    context: this,
    builder: builder,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    backgroundColor: backgroundColor,
    shape: shape,
  );
}

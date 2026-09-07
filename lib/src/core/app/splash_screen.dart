import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../constant/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    body: SafeArea(
      child: SizedBox(
        width: .infinity,
        child: Column(
          crossAxisAlignment: .center,
          children: [
            const Spacer(flex: 7),
            Column(
              mainAxisSize: .min,
              children: [
                Assets.images.appLogo.image(width: 52, height: 52),
                const SizedBox(height: 14),
                const Text('App Name', style: TextStyle(fontSize: 20, fontWeight: .w700, letterSpacing: 0.7)),
              ],
            ),
            const Spacer(flex: 6),
            Semantics(
              label: context.l10n.commonLoading,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: context.color.primary,
                  strokeWidth: 2.7,
                  strokeCap: .round,
                  backgroundColor: context.color.primary.withValues(alpha: .18),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ),
  );
}

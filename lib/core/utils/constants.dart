import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trivico/firebase_options.dart';

const baseUrl = 'https://opentdb.com/';

const kContentPadding = EdgeInsets.all(24);

/// Border Radius Constants
const kDefaultBorderRadius = 16.0;

/// Padding Constants
const kDefaultPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);
const kDisabledOpacity = 0.5;
const kLargeBorderRadius = 24.0;

const kMediumPadding = EdgeInsets.all(16);
const kOverlayOpacity = 0.9;

/// Opacity Constants
const kPrimaryOpacity = 0.1;

const kSecondaryOpacity = 0.2;
const kSmallBorderRadius = 12.0;
const kSmallPadding = EdgeInsets.all(12);
const timerSeconds = 10;

Future<void> loadMainDependencies() async {
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kReleaseMode) {
    const fatalError = true;
    // Non-async exceptions
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
  }
}

enum TriviaDifficulty {
  easy,
  medium,
  hard,
}

/// Button Styles
mixin UIButtons {
  static ButtonStyle primaryButton(BuildContext context, {Color? color}) {
    return FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
    );
  }
}

/// Decoration Mixins
mixin UIDecorations {
  static BoxDecoration circularDecoration(
    BuildContext context, {
    Color? color,
  }) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.primary;

    return BoxDecoration(
      color: primaryColor.withValues(alpha: kPrimaryOpacity),
      shape: BoxShape.circle,
    );
  }

  static BoxDecoration primaryCardDecoration(
    BuildContext context, {
    Color? color,
  }) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.primary;

    return BoxDecoration(
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          primaryColor.withValues(alpha: kPrimaryOpacity),
          primaryColor.withValues(alpha: kPrimaryOpacity / 2),
        ],
      ),
    );
  }
}

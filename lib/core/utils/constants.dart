import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trivico/firebase_options.dart';

const baseUrl = 'https://opentdb.com/';

const timerSeconds = 15;

const kDefaultPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);

enum TriviaDifficulty {
  easy,
  medium,
  hard,
}

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

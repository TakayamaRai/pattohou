import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/models/local/shared_preference.dart';
import 'package:pattohou/view/signIn/sign_in.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.wait([
      SP.instance(),
      Firebase.initializeApp()
    ]);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    runApp(
      const ProviderScope(child: MyApp()),
    );
  }, ((error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: MyColor.primary,
          fontFamily: 'Roboto'),
      home:  SignInPage(),
    );
  }
}
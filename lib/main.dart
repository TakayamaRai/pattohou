import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/data/color.dart';
import 'package:pattohou/view/components/complete_dialog.dart';
import 'package:pattohou/view/components/scroll_view.dart';
import 'package:pattohou/view/components/textField.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.wait([
      // SharedPreferencesUtil.instance(),
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
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyScrollView(
        title: "title",
        isBackIcon: false,
        child:Stack(
          children: [
            Column(children: [
              Container(color: Colors.white,height: 500,width: 100,),
              Container(color: Colors.red,height: 400,width: 100,),
              Image.asset("assets/complete.png"),
              MyTextFieldWithLabel(
                title: "代理人　氏名",
                hintText: "山田　太郎",
                controller: ref.watch(_proxyNameControllerProvider),
                errorText: ref.watch(_errorTextOfProxyName),
                hasRequiredLabel: true,
                onChanged: (value) {
                },
              ),
            ],),
          ],
        )
    );
  }
}

final _proxyNameControllerProvider =
Provider.autoDispose<TextEditingController>((ref) =>
TextEditingController()..text = "");


/// 代理人　氏名 [ErrorText]
final _errorTextOfProxyName = Provider.autoDispose<String>((ref) {
    return "";
  }
);
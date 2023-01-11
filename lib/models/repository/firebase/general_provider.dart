import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



final firebaseCrashlyticsProvider = Provider((ref) => FirebaseCrashlytics.instance);

final firebaseAnalyticsProvider = Provider((ref) => FirebaseAnalytics.instance);



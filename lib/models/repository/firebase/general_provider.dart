import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



final firebaseCrashlyticsProvider = Provider((ref) => FirebaseCrashlytics.instance);

final firebaseAnalyticsProvider = Provider((ref) => FirebaseAnalytics.instance);



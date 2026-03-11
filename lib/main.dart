import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chrome_cast/cast_context.dart';
import 'package:flutter_chrome_cast/discovery.dart';
import 'package:flutter_chrome_cast/entities.dart';
import 'package:flutter_chrome_cast/enums.dart';
import 'package:flutter_chrome_cast/models/android/android_cast_options.dart';
import 'package:flutter_chrome_cast/models/ios/ios_cast_options.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await initCast();

  runApp(const UzzaMaxApp());
}

Future<void> initCast() async {
  const appId = GoogleCastDiscoveryCriteria.kDefaultApplicationId;

  if (Platform.isAndroid) {
    final options = GoogleCastOptionsAndroid(
      appId: appId,
      stopCastingOnAppTerminated: false,
    );

    GoogleCastContext.instance.setSharedInstanceWithOptions(options);
  } else if (Platform.isIOS) {
    final options = IOSGoogleCastOptions(
      GoogleCastDiscoveryCriteriaInitialize.initWithApplicationID(appId),
      stopCastingOnAppTerminated: false,
    );

    GoogleCastContext.instance.setSharedInstanceWithOptions(options);
  }

  GoogleCastDiscoveryManager.instance.startDiscovery();
}

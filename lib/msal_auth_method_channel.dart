import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'msal_auth_platform_interface.dart';

/// An implementation of [MsalAuthPlatform] that uses method channels.
class MethodChannelMsalAuth extends MsalAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('msal_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

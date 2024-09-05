import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'msal_auth_method_channel.dart';

abstract class MsalAuthPlatform extends PlatformInterface {
  /// Constructs a MsalAuthPlatform.
  MsalAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static MsalAuthPlatform _instance = MethodChannelMsalAuth();

  /// The default instance of [MsalAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelMsalAuth].
  static MsalAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MsalAuthPlatform] when
  /// they register themselves.
  static set instance(MsalAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

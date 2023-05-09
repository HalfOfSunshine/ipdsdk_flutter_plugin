import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ipdsdk_flutter_plugin_method_channel.dart';

abstract class IpdsdkFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a IpdsdkFlutterPluginPlatform.
  IpdsdkFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static IpdsdkFlutterPluginPlatform _instance = MethodChannelIpdsdkFlutterPlugin();

  /// The default instance of [IpdsdkFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelIpdsdkFlutterPlugin].
  static IpdsdkFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IpdsdkFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(IpdsdkFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

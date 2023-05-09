
import 'ipdsdk_flutter_plugin_platform_interface.dart';

class IpdsdkFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return IpdsdkFlutterPluginPlatform.instance.getPlatformVersion();
  }
}

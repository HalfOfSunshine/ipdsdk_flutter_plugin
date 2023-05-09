import 'package:flutter_test/flutter_test.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin_platform_interface.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIpdsdkFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements IpdsdkFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IpdsdkFlutterPluginPlatform initialPlatform = IpdsdkFlutterPluginPlatform.instance;

  test('$MethodChannelIpdsdkFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIpdsdkFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    IpdsdkFlutterPlugin ipdsdkFlutterPlugin = IpdsdkFlutterPlugin();
    MockIpdsdkFlutterPluginPlatform fakePlatform = MockIpdsdkFlutterPluginPlatform();
    IpdsdkFlutterPluginPlatform.instance = fakePlatform;

    expect(await ipdsdkFlutterPlugin.getPlatformVersion(), '42');
  });
}

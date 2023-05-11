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

  @override
  void initMethodChannel(MsgCallback? onMethodChannelCreated) {
    // TODO: implement initMethodChannel
  }

  @override
  void showContentVideoFeedPage(String adId,
      {AdCallback? onVideoDidStartPlay,
      AdCallback? onVideoDidPause,
      AdCallback? onVideoDidResume,
      AdCallback? onVideoDidEndPlay,
      AdCallback? onContentDidFullDisplay,
      AdCallback? onContentDidEndDisplay,
      AdCallback? onContentDidPause,
      AdCallback? onContentDidResume,
      AdCallback? onError}) {
    // TODO: implement showContentVideoFeedPage
  }

  @override
  void showContentVideoHorizontal(String adId,
      {AdCallback? onVideoDidStartPlay,
      AdCallback? onVideoDidPause,
      AdCallback? onVideoDidResume,
      AdCallback? onVideoDidEndPlay,
      AdCallback? onContentDidFullDisplay,
      AdCallback? onContentDidEndDisplay,
      AdCallback? onContentDidPause,
      AdCallback? onContentDidResume,
      AdCallback? onHorizontalFeedDetailDidEnter,
      AdCallback? onHorizontalFeedDetailDidLeave,
      AdCallback? onHorizontalFeedDetailDidAppear,
      AdCallback? onHorizontalFeedDetailDidDisappear,
      AdCallback? onError}) {
    // TODO: implement showContentVideoHorizontal
  }

  @override
  void showContentVideoImageText(String adId,
      {AdCallback? onVideoDidStartPlay,
      AdCallback? onVideoDidPause,
      AdCallback? onVideoDidResume,
      AdCallback? onVideoDidEndPlay,
      AdCallback? onContentDidFullDisplay,
      AdCallback? onContentDidEndDisplay,
      AdCallback? onContentDidPause,
      AdCallback? onContentDidResume,
      AdCallback? onHorizontalFeedDetailDidEnter,
      AdCallback? onHorizontalFeedDetailDidLeave,
      AdCallback? onHorizontalFeedDetailDidAppear,
      AdCallback? onHorizontalFeedDetailDidDisappear,
      AdCallback? onImageTextDetailDidEnter,
      AdCallback? onImageTextDetailDidLeave,
      AdCallback? onImageTextDetailDidAppear,
      AdCallback? onImageTextDetailDidDisappear,
      AdCallback? onImageTextDetailDidLoadFinish,
      AdCallback? onImageTextDetailDidScroll,
      AdCallback? onError}) {
    // TODO: implement showContentVideoImageText
  }

  @override
  void showContentVideoListPage(String adId,
      {AdCallback? onVideoDidStartPlay,
      AdCallback? onVideoDidPause,
      AdCallback? onVideoDidResume,
      AdCallback? onVideoDidEndPlay,
      AdCallback? onContentDidFullDisplay,
      AdCallback? onContentDidEndDisplay,
      AdCallback? onContentDidPause,
      AdCallback? onContentDidResume,
      AdCallback? onError}) {
    // TODO: implement showContentVideoListPage
  }

  @override
  void showH5Ad(String adId, String userID, String userName, String userAvatar,
      int userIntegral, String ext,
      {AdCallback? onAdLoad,
      AdCallback? onError,
      AdCallback? onRewardAdLoad,
      AdCallback? onRewardAdReward,
      AdCallback? onRewardAdClick,
      AdCallback? onRewardAdError}) {
    // TODO: implement showH5Ad
  }

  @override
  void showInterstitialAd(String adId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onAdClose,
      AdCallback? onAdDetailClose,
      AdCallback? onError}) {
    // TODO: implement showInterstitialAd
  }

  @override
  void showRewardVideoAd(String adId, String userId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onReward,
      AdCallback? onAdClick,
      AdCallback? onVideoComplete,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    // TODO: implement showRewardVideoAd
  }

  @override
  void showSplashAd(String adId, int fetchDelay,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onCountdownEnd,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    // TODO: implement showSplashAd
  }

  @override
  void registerIPDSDK(String appId,
      {MsgCallback? onIPDSDKRegistered, MsgCallback? onIPDSDKRegisterFail}) {
    // TODO: implement registerIPDSDK
  }
}

void main() {
  final IpdsdkFlutterPluginPlatform initialPlatform =
      IpdsdkFlutterPluginPlatform.instance;

  test('$MethodChannelIpdsdkFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIpdsdkFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    IpdsdkFlutterPlugin ipdsdkFlutterPlugin = IpdsdkFlutterPlugin();
    MockIpdsdkFlutterPluginPlatform fakePlatform =
        MockIpdsdkFlutterPluginPlatform();
    IpdsdkFlutterPluginPlatform.instance = fakePlatform;

    expect(await ipdsdkFlutterPlugin.getPlatformVersion(), '42');
  });
}

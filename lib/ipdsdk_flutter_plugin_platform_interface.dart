import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';

import 'ipdsdk_flutter_plugin_method_channel.dart';

typedef void IPDSDKNativeViewCreatedCallback(
    MethodChannelIpdsdkFlutterPlugin controller);
typedef void IPDSDKNativeEventCallback(MethodCall call);

typedef MsgCallback = void Function(String msg);
typedef AdCallback = void Function(String id, String msg);
typedef AdErrorCallback = void Function(String id, int code, String message);

abstract class IpdsdkFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a IpdsdkFlutterPluginPlatform.
  IpdsdkFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static IpdsdkFlutterPluginPlatform _instance =
      MethodChannelIpdsdkFlutterPlugin();

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

  void registerIPDSDK(String appId,
      {MsgCallback? onIPDSDKRegistered, MsgCallback? onIPDSDKRegisterFail}) {
    throw UnimplementedError('registerIPDSDK() has not been implemented.');
  }

  void initMethodChannel(MsgCallback? onMethodChannelCreated) {
    throw UnimplementedError('initMethodChannel() has not been implemented.');
  }

  @override
  void showSplashAd(String adId, int fetchDelay,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onCountdownEnd,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    throw UnimplementedError('showSplashAd() has not been implemented.');
  }

  /// show reward video ad
  @override
  void showRewardVideoAd(String adId, String userId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onReward,
      AdCallback? onAdClick,
      AdCallback? onVideoComplete,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    throw UnimplementedError('showRewardVideoAd() has not been implemented.');
  }

  /// show interstitial ad
  @override
  void showInterstitialAd(String adId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onAdClose,
      AdCallback? onAdDetailClose,
      AdCallback? onError}) {
    throw UnimplementedError('showInterstitialAd() has not been implemented.');
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
    throw UnimplementedError('showH5Ad() has not been implemented.');
  }

  //self.contentId
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
    throw UnimplementedError(
        'showContentVideoListPage() has not been implemented.');
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
    throw UnimplementedError(
        'showContentVideoFeedPage() has not been implemented.');
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
    throw UnimplementedError(
        'showContentVideoHorizontal() has not been implemented.');
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
    throw UnimplementedError(
        'showContentVideoImageText() has not been implemented.');
  }
}

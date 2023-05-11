import 'ipdsdk_flutter_plugin_platform_interface.dart';

class IpdsdkFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return IpdsdkFlutterPluginPlatform.instance.getPlatformVersion();
  }

  void registerIPDSDK(String appId,
      {MsgCallback? onIPDSDKRegistered, MsgCallback? onIPDSDKRegisterFail}) {
    IpdsdkFlutterPluginPlatform.instance.registerIPDSDK(appId,
        onIPDSDKRegistered: onIPDSDKRegistered,
        onIPDSDKRegisterFail: onIPDSDKRegisterFail);
  }

  void initMethodChannel(MsgCallback? onMethodChannelCreated) {
    IpdsdkFlutterPluginPlatform.instance
        .initMethodChannel(onMethodChannelCreated);
  }

  void showSplashAd(String adId, int fetchDelay,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onCountdownEnd,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    IpdsdkFlutterPluginPlatform.instance.showSplashAd(adId, fetchDelay,
        onAdLoad: onAdLoad,
        onAdShow: onAdShow,
        onAdClick: onAdClick,
        onCountdownEnd: onCountdownEnd,
        onAdClose: onAdClose,
        onError: onError);
  }

  /// show reward video ad
  void showRewardVideoAd(String adId, String userId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onReward,
      AdCallback? onAdClick,
      AdCallback? onVideoComplete,
      AdCallback? onAdClose,
      AdCallback? onError}) {
    IpdsdkFlutterPluginPlatform.instance.showRewardVideoAd(adId, userId,
        onAdLoad: onAdLoad,
        onAdShow: onAdShow,
        onReward: onReward,
        onAdClick: onAdClick,
        onVideoComplete: onVideoComplete,
        onAdClose: onAdClose,
        onError: onError);
  }

  /// show interstitial ad
  void showInterstitialAd(String adId,
      {AdCallback? onAdLoad,
      AdCallback? onAdShow,
      AdCallback? onAdClick,
      AdCallback? onAdClose,
      AdCallback? onAdDetailClose,
      AdCallback? onError}) {
    IpdsdkFlutterPluginPlatform.instance.showInterstitialAd(adId,
        onAdLoad: onAdLoad,
        onAdShow: onAdShow,
        onAdClick: onAdClick,
        onAdClose: onAdClose,
        onAdDetailClose: onAdDetailClose,
        onError: onError);
  }

  void showH5Ad(String adId, String userID, String userName, String userAvatar,
      int userIntegral, String ext,
      {AdCallback? onAdLoad,
      AdCallback? onError,
      AdCallback? onRewardAdLoad,
      AdCallback? onRewardAdReward,
      AdCallback? onRewardAdClick,
      AdCallback? onRewardAdError}) {
    IpdsdkFlutterPluginPlatform.instance.showH5Ad(
        adId, userID, userName, userAvatar, userIntegral, ext,
        onAdLoad: onAdLoad,
        onError: onError,
        onRewardAdLoad: onRewardAdLoad,
        onRewardAdReward: onRewardAdReward,
        onRewardAdClick: onRewardAdClick,
        onRewardAdError: onRewardAdError);
  }

  //self.contentId
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
    IpdsdkFlutterPluginPlatform.instance.showContentVideoListPage(adId,
        onVideoDidStartPlay: onVideoDidStartPlay,
        onVideoDidPause: onVideoDidPause,
        onVideoDidResume: onVideoDidResume,
        onVideoDidEndPlay: onVideoDidEndPlay,
        onContentDidFullDisplay: onContentDidFullDisplay,
        onContentDidEndDisplay: onContentDidEndDisplay,
        onContentDidPause: onContentDidPause,
        onContentDidResume: onContentDidResume,
        onError: onError);
  }

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
    IpdsdkFlutterPluginPlatform.instance.showContentVideoFeedPage(adId,
        onVideoDidStartPlay: onVideoDidStartPlay,
        onVideoDidPause: onVideoDidPause,
        onVideoDidResume: onVideoDidResume,
        onVideoDidEndPlay: onVideoDidEndPlay,
        onContentDidFullDisplay: onContentDidFullDisplay,
        onContentDidEndDisplay: onContentDidEndDisplay,
        onContentDidPause: onContentDidPause,
        onContentDidResume: onContentDidResume,
        onError: onError);
  }

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
    IpdsdkFlutterPluginPlatform.instance.showContentVideoHorizontal(adId,
        onVideoDidStartPlay: onVideoDidStartPlay,
        onVideoDidPause: onVideoDidPause,
        onVideoDidResume: onVideoDidResume,
        onVideoDidEndPlay: onVideoDidEndPlay,
        onContentDidFullDisplay: onContentDidFullDisplay,
        onContentDidEndDisplay: onContentDidEndDisplay,
        onContentDidPause: onContentDidPause,
        onContentDidResume: onContentDidResume,
        onHorizontalFeedDetailDidEnter: onHorizontalFeedDetailDidEnter,
        onHorizontalFeedDetailDidLeave: onHorizontalFeedDetailDidLeave,
        onHorizontalFeedDetailDidAppear: onHorizontalFeedDetailDidAppear,
        onHorizontalFeedDetailDidDisappear: onHorizontalFeedDetailDidDisappear,
        onError: onError);
  }

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
    IpdsdkFlutterPluginPlatform.instance.showContentVideoImageText(adId,
        onVideoDidStartPlay: onVideoDidStartPlay,
        onVideoDidPause: onVideoDidPause,
        onVideoDidResume: onVideoDidResume,
        onVideoDidEndPlay: onVideoDidEndPlay,
        onContentDidFullDisplay: onContentDidFullDisplay,
        onContentDidEndDisplay: onContentDidEndDisplay,
        onContentDidPause: onContentDidPause,
        onContentDidResume: onContentDidResume,
        onHorizontalFeedDetailDidEnter: onHorizontalFeedDetailDidEnter,
        onHorizontalFeedDetailDidLeave: onHorizontalFeedDetailDidLeave,
        onHorizontalFeedDetailDidAppear: onHorizontalFeedDetailDidAppear,
        onHorizontalFeedDetailDidDisappear: onHorizontalFeedDetailDidDisappear,
        onImageTextDetailDidEnter: onImageTextDetailDidEnter,
        onImageTextDetailDidLeave: onImageTextDetailDidLeave,
        onImageTextDetailDidAppear: onImageTextDetailDidAppear,
        onImageTextDetailDidDisappear: onImageTextDetailDidDisappear,
        onImageTextDetailDidLoadFinish: onImageTextDetailDidLoadFinish,
        onImageTextDetailDidScroll: onImageTextDetailDidScroll,
        onError: onError);
  }
}

import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin.dart';

class RewardVideoPage extends StatelessWidget {
  final _ipdsdkFlutterPlugin = IpdsdkFlutterPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showRewardVideoAd(
                    "Puxxpzxw95zx",
                    "userId123",
                    onAdLoad: (String id, String msg) {
                      print("RewardVideoAd onAdLoad");
                    },
                    onAdShow: (String id, String msg) {
                      print("RewardVideoAd onAdShow");
                    },
                    onReward: (String id, String msg) {
                      print("RewardVideoAd onReward,transId = " + (msg));
                    },
                    onAdClick: (String id, String msg) {
                      print("RewardVideoAd onAdClick");
                    },
                    onVideoComplete: (String id, String msg) {
                      print("RewardVideoAd onVideoComplete");
                    },
                    onAdClose: (String id, String msg) {
                      print("RewardVideoAd onAdClose");
                    },
                    onError: (String id, String msg) {
                      print("RewardVideoAd onError = " + (msg));
                    },
                  );
                },
                child: Text("加载激励视频广告")),
          ],
        ),
      ),
    );
  }
}

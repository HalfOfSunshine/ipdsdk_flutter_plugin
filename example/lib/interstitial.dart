import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin.dart';

class InterstitialPage extends StatelessWidget {
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
                  _ipdsdkFlutterPlugin.showInterstitialAd(
                    "P3twxacs3pu4",
                    onAdLoad: (String id, String msg) {
                      print("InterstitialAd onAdLoad");
                    },
                    onAdShow: (String id, String msg) {
                      print("InterstitialAd onAdShow");
                    },
                    onAdClick: (String id, String msg) {
                      print("InterstitialAd onAdClick");
                    },
                    onAdClose: (String id, String msg) {
                      print("InterstitialAd onAdClose");
                    },
                    onAdDetailClose: (String id, String msg) {
                      print("InterstitialAd onAdDetailClose");
                    },
                    onError: (String id, String msg) {
                      print("InterstitialAd onError = " + (msg));
                    },
                  );
                },
                child: Text("加载插屏广告")),
          ],
        ),
      ),
    );
  }
}

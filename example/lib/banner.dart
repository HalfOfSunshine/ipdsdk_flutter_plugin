import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/banner_ad_view.dart';

class BannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BannerAdView(
              adId: "P334tw3t7qdm",
              width: 300,
              height: 300 / 6.4,
              onAdLoad: (String id, String msg) {
                print("BannerAd onAdLoad");
              },
              onAdShow: (String id, String msg) {
                print("BannerAd onAdShow");
              },
              onAdClick: (String id, String msg) {
                print("BannerAd onAdClick");
              },
              onAdClose: (String id, String msg) {
                print("BannerAd onAdClose");
              },
              onError: (String id, String msg) {
                print("BannerAd onError = " + (msg));
              },
              onAdDetailClose: (String id, String msg) {
                print("BannerAd onAdDetailClose");
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/native_express_ad_view.dart';

class NativeExpressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NativeExpressAdView(
              adId: "P8elfpe027yz",
              width: 300,
              height: 200,
              onAdLoad: (String id, String msg) {
                print("NativeExpressAd onAdLoad");
              },
              onAdShow: (String id, String msg) {
                print("NativeExpressAd onAdShow");
              },
              onAdClick: (String id, String msg) {
                print("NativeExpressAd onAdClick");
              },
              onAdDislike: (String id, String msg) {
                print("NativeExpressAd onAdDislike");
              },
              onError: (String id, String msg) {
                print("NativeExpressAd onError = " + (msg));
              },
              onAdRenderSuccess: (String id, String msg) {
                print("NativeExpressAd onAdRenderSuccess");
              },
              onAdRenderFail: (String id, String msg) {
                print("NativeExpressAd onAdRenderFail");
              },
            ),
          ],
        ),
      ),
    );
  }
}

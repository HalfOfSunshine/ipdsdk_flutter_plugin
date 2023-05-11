import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin.dart';
import 'banner.dart';
import 'content_video_view_selector.dart';
import 'native_express.dart';
import 'reward_video.dart';
import 'interstitial.dart';
import 'content_native_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _ipdsdkFlutterPlugin = IpdsdkFlutterPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _ipdsdkFlutterPlugin.initMethodChannel((msg) {
      print("iOS->flutter事件通道建立成功");
      _ipdsdkFlutterPlugin.registerIPDSDK('Ibh2udfg4',
          onIPDSDKRegistered: (msg) {
        print(msg);
      }, onIPDSDKRegisterFail: (msg) {
        print(msg);
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _ipdsdkFlutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/reward-video': (BuildContext context) => RewardVideoPage(),
        '/banner': (BuildContext context) => BannerPage(),
        '/interstitial': (BuildContext context) => InterstitialPage(),
        '/content_native_page': (BuildContext context) => ContentNativePage(),
        '/content_video_view_selector': (BuildContext context) =>
            ContentVideoViewSelector(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool splashTitle = true;
  final _ipdsdkFlutterPlugin = IpdsdkFlutterPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showSplashAd(
                    "Pulcfghrl0c3",
                    5,
                    onAdLoad: (String id, String msg) {
                      print("SplashAd onAdLoad");
                    },
                    onAdShow: (String id, String msg) {
                      print("SplashAd onAdShow");
                    },
                    onAdClick: (String id, String msg) {
                      print("SplashAd onAdClick");
                    },
                    onCountdownEnd: (String id, String msg) {
                      print("SplashAd onVideoComplete");
                    },
                    onAdClose: (String id, String msg) {
                      print("SplashAd onAdClose");
                    },
                    onError: (String id, String msg) {
                      print("SplashAd onError = " + (msg));
                    },
                  );
                },
                child: Text("开屏广告")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/reward-video');
                },
                child: Text("激励视频广告")),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/banner');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BannerPage();
                  })).then((value) {
                    //
                  });
                },
                child: Text("Banner 广告")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/interstitial');
                },
                child: Text("插屏广告")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/content_native_page');
                },
                child: Text("视频内容(ios原生vc形式)")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ContentVideoViewSelector();
                  })).then((value) {
                    //
                  });
                },
                child: Text("视频内容(视图嵌入形式)")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NativeExpressPage();
                  })).then((value) {
                    //
                  });
                },
                child: Text("信息流广告")),
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showH5Ad(
                    "请联系运营申请",
                    "00012282",
                    "吊炸天524",
                    "",
                    10000,
                    "超级无敌4",
                    onAdLoad: (String id, String msg) {
                      print("H5 onAdLoad");
                    },
                    onError: (String id, String msg) {
                      print("H5 onAdLoad = " + (msg));
                    },
                    onRewardAdLoad: (String id, String msg) {
                      print("H5 onRewardAdLoad");
                    },
                    onRewardAdReward: (String id, String msg) {
                      print("H5 onRewardAdReward = " + (msg));
                    },
                    onRewardAdClick: (String id, String msg) {
                      print("H5 onRewardAdClick");
                    },
                    onRewardAdError: (String id, String msg) {
                      print("H5 onRewardAdError = " + (msg));
                    },
                  );
                },
                child: Text("H5广告")),
          ],
        ),
      ),
    );
  }
}

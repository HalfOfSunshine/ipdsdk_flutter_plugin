import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/ipdsdk_flutter_plugin.dart';

class ContentNativePage extends StatelessWidget {
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
                  _ipdsdkFlutterPlugin.showContentVideoListPage(
                    "请联系运营申请",
                    onError: (String id, String msg) {
                      print("ContentVideo onError = " + (msg));
                    },
                    onVideoDidPause: (String id, String msg) {
                      print("ContentVideo onVideoDidPause");
                    },
                    onVideoDidResume: (String id, String msg) {
                      print("ContentVideo onVideoDidResume");
                    },
                    onVideoDidEndPlay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidFullDisplay: (String id, String msg) {
                      print("ContentVideo onContentDidFullDisplay");
                    },
                    onContentDidEndDisplay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidPause: (String id, String msg) {
                      print("ContentVideo onContentDidPause");
                    },
                    onContentDidResume: (String id, String msg) {
                      print("ContentVideo onContentDidResume");
                    },
                  );
                },
                child: Text("视频内容列表")),
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showContentVideoFeedPage(
                    "请联系运营申请",
                    onError: (String id, String msg) {
                      print("ContentVideo onError = " + (msg));
                    },
                    onVideoDidPause: (String id, String msg) {
                      print("ContentVideo onVideoDidPause");
                    },
                    onVideoDidResume: (String id, String msg) {
                      print("ContentVideo onVideoDidResume");
                    },
                    onVideoDidEndPlay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidFullDisplay: (String id, String msg) {
                      print("ContentVideo onContentDidFullDisplay");
                    },
                    onContentDidEndDisplay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidPause: (String id, String msg) {
                      print("ContentVideo onContentDidPause");
                    },
                    onContentDidResume: (String id, String msg) {
                      print("ContentVideo onContentDidResume");
                    },
                  );
                },
                child: Text("视频内容瀑布流")),
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showContentVideoHorizontal(
                    "请联系运营申请",
                    onError: (String id, String msg) {
                      print("ContentVideo onError = " + (msg));
                    },
                    onVideoDidPause: (String id, String msg) {
                      print("ContentVideo onVideoDidPause");
                    },
                    onVideoDidResume: (String id, String msg) {
                      print("ContentVideo onVideoDidResume");
                    },
                    onVideoDidEndPlay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidFullDisplay: (String id, String msg) {
                      print("ContentVideo onContentDidFullDisplay");
                    },
                    onContentDidEndDisplay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidPause: (String id, String msg) {
                      print("ContentVideo onContentDidPause");
                    },
                    onContentDidResume: (String id, String msg) {
                      print("ContentVideo onContentDidResume");
                    },
                    onHorizontalFeedDetailDidAppear: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidAppear");
                    },
                    onHorizontalFeedDetailDidDisappear:
                        (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidDisappear");
                    },
                    onHorizontalFeedDetailDidEnter: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidEnter");
                    },
                    onHorizontalFeedDetailDidLeave: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidLeave");
                    },
                  );
                },
                child: Text("视频内容横版")),
            ElevatedButton(
                onPressed: () {
                  _ipdsdkFlutterPlugin.showContentVideoImageText(
                    "请联系运营申请",
                    onError: (String id, String msg) {
                      print("ContentVideo onError = " + (msg));
                    },
                    onVideoDidPause: (String id, String msg) {
                      print("ContentVideo onVideoDidPause");
                    },
                    onVideoDidResume: (String id, String msg) {
                      print("ContentVideo onVideoDidResume");
                    },
                    onVideoDidEndPlay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidFullDisplay: (String id, String msg) {
                      print("ContentVideo onContentDidFullDisplay");
                    },
                    onContentDidEndDisplay: (String id, String msg) {
                      print("ContentVideo onVideoDidEndPlay");
                    },
                    onContentDidPause: (String id, String msg) {
                      print("ContentVideo onContentDidPause");
                    },
                    onContentDidResume: (String id, String msg) {
                      print("ContentVideo onContentDidResume");
                    },
                    onHorizontalFeedDetailDidAppear: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidAppear");
                    },
                    onHorizontalFeedDetailDidDisappear:
                        (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidDisappear");
                    },
                    onHorizontalFeedDetailDidEnter: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidEnter");
                    },
                    onHorizontalFeedDetailDidLeave: (String id, String msg) {
                      print("ContentVideo onHorizontalFeedDetailDidLeave");
                    },
                    onImageTextDetailDidAppear: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidAppear");
                    },
                    onImageTextDetailDidDisappear: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidDisappear");
                    },
                    onImageTextDetailDidEnter: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidEnter");
                    },
                    onImageTextDetailDidLeave: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidLeave");
                    },
                    onImageTextDetailDidLoadFinish: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidLoadFinish");
                    },
                    onImageTextDetailDidScroll: (String id, String msg) {
                      print("ContentVideo onImageTextDetailDidScroll");
                    },
                  );
                },
                child: Text("视频内容图文")),
          ],
        )));
  }
}

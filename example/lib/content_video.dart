import 'package:flutter/material.dart';
import 'package:ipdsdk_flutter_plugin/content_video_view.dart';

class ContentVideoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ContentVideoListPageView(
              adId: "请联系运营申请",
              width: 300,
              height: 300,
              onVideoDidStartPlay: (String id, String msg) {
                print("ContentAd onVideoDidStartPlay");
              },
              onVideoDidPause: (String id, String msg) {
                print("ContentAd onVideoDidPause");
              },
              onVideoDidResume: (String id, String msg) {
                print("ContentAd onVideoDidResume");
              },
              onVideoDidEndPlay: (String id, String msg) {
                print("ContentAd onVideoDidEndPlay");
              },
              onVideoDidFailedToPlay: (String id, String msg) {
                print("ContentAd onVideoDidFailedToPlay = " + (msg));
              },
              onContentDidFullDisplay: (String id, String msg) {
                print("ContentAd onContentDidFullDisplay");
              },
              onContentDidEndDisplay: (String id, String msg) {
                print("ContentAd onContentDidEndDisplay");
              },
              onContentDidPause: (String id, String msg) {
                print("ContentAd onContentDidPause");
              },
              onContentDidResume: (String id, String msg) {
                print("ContentAd onContentDidResume");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContentVideoFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ContentVideoFeedPageView(
              adId: "请联系运营申请",
              width: 300,
              height: 300,
              onVideoDidStartPlay: (String id, String msg) {
                print("ContentAd onVideoDidStartPlay");
              },
              onVideoDidPause: (String id, String msg) {
                print("ContentAd onVideoDidPause");
              },
              onVideoDidResume: (String id, String msg) {
                print("ContentAd onVideoDidResume");
              },
              onVideoDidEndPlay: (String id, String msg) {
                print("ContentAd onVideoDidEndPlay");
              },
              onVideoDidFailedToPlay: (String id, String msg) {
                print("ContentAd onVideoDidFailedToPlay = " + (msg));
              },
              onContentDidFullDisplay: (String id, String msg) {
                print("ContentAd onContentDidFullDisplay");
              },
              onContentDidEndDisplay: (String id, String msg) {
                print("ContentAd onContentDidEndDisplay");
              },
              onContentDidPause: (String id, String msg) {
                print("ContentAd onContentDidPause");
              },
              onContentDidResume: (String id, String msg) {
                print("ContentAd onContentDidResume");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContentVideoHorizontalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ContentVideoHorizontalPageView(
              adId: "请联系运营申请",
              width: 300,
              height: 300,
              onVideoDidStartPlay: (String id, String msg) {
                print("ContentAd onVideoDidStartPlay");
              },
              onVideoDidPause: (String id, String msg) {
                print("ContentAd onVideoDidPause");
              },
              onVideoDidResume: (String id, String msg) {
                print("ContentAd onVideoDidResume");
              },
              onVideoDidEndPlay: (String id, String msg) {
                print("ContentAd onVideoDidEndPlay");
              },
              onVideoDidFailedToPlay: (String id, String msg) {
                print("ContentAd onVideoDidFailedToPlay = " + (msg));
              },
              onContentDidFullDisplay: (String id, String msg) {
                print("ContentAd onContentDidFullDisplay");
              },
              onContentDidEndDisplay: (String id, String msg) {
                print("ContentAd onContentDidEndDisplay");
              },
              onContentDidPause: (String id, String msg) {
                print("ContentAd onContentDidPause");
              },
              onContentDidResume: (String id, String msg) {
                print("ContentAd onContentDidResume");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContentVideoImageTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ContentVideoImageTextPageView(
              adId: "请联系运营申请",
              width: 300,
              height: 300,
              onVideoDidStartPlay: (String id, String msg) {
                print("ContentAd onVideoDidStartPlay");
              },
              onVideoDidPause: (String id, String msg) {
                print("ContentAd onVideoDidPause");
              },
              onVideoDidResume: (String id, String msg) {
                print("ContentAd onVideoDidResume");
              },
              onVideoDidEndPlay: (String id, String msg) {
                print("ContentAd onVideoDidEndPlay");
              },
              onVideoDidFailedToPlay: (String id, String msg) {
                print("ContentAd onVideoDidFailedToPlay = " + (msg));
              },
              onContentDidFullDisplay: (String id, String msg) {
                print("ContentAd onContentDidFullDisplay");
              },
              onContentDidEndDisplay: (String id, String msg) {
                print("ContentAd onContentDidEndDisplay");
              },
              onContentDidPause: (String id, String msg) {
                print("ContentAd onContentDidPause");
              },
              onContentDidResume: (String id, String msg) {
                print("ContentAd onContentDidResume");
              },
            ),
          ],
        ),
      ),
    );
  }
}

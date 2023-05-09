#import <Flutter/Flutter.h>

@interface IpdsdkFlutterPlugin : NSObject<FlutterPlugin,FlutterStreamHandler>

@property (nonatomic, strong) NSObject <FlutterBinaryMessenger> *messenger;
@property (nonatomic, strong)  FlutterMethodChannel  *methodChannel;
+ (IpdsdkFlutterPlugin *)shareInstance;
@end

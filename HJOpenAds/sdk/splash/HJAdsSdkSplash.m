#import "HJAdsSdkSplash.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>
#import "HJAdsRequest.h"



@interface HJAdsSdkSplash ()<WindMillSplashAdDelegate>
@property (nonatomic, strong) WindMillSplashAd *splashAd;
@end

@implementation HJAdsSdkSplash

- (instancetype)initWithRequest:(HJAdsRequest *)request
                          extra:(NSDictionary * _Nullable)extra {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.splashAd = [[WindMillSplashAd alloc] initWithRequest:req extra:extra];
    self.splashAd.delegate = self;
    return self;
    
}
- (instancetype)initWithRequest:(HJAdsRequest *)request {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.splashAd = [[WindMillSplashAd alloc] initWithRequest:req extra:nil];
    self.splashAd.delegate = self;
    return self;
}

- (BOOL)isAdReady {
    return self.splashAd && self.splashAd.isAdReady;
}

-(void)loadAdAndShow {
    if (self.splashAd) {
        self.splashAd.rootViewController = self.rootViewController;
        [self.splashAd loadAdAndShow];
    }
}

- (void)loadAd {
    if (self.splashAd) {
        [self.splashAd loadAd];
    }
}

- (void)showAdInWindow:(UIWindow *)window {
    if (self.splashAd && self.splashAd.isAdReady) {
        [self.splashAd showAdInWindow: window withBottomView:nil];
    }
}

#pragma mark - ----- WindMillSplashAdDelegate -----

//成功加载广告
- (void)onSplashAdDidLoad:(WindMillSplashAd *)splashAd {
    NSLog(@"HJAdsSdkSplash onSplashAdDidLoad %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( onSplashAdSuccessLoad:)]) {
                [self.delegate onSplashAdSuccessLoad:splashAd.placementId];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdSuccessLoad");
            }
    }
}

//广告加载失败
- (void)onSplashAdLoadFail:(WindMillSplashAd *)splashAd error:(NSError *)error {
    NSLog(@"HJAdsSdkSplash onSplashAdLoadFail %@ error: %@", NSStringFromSelector(_cmd), error);
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdFailToLoad:error:)]) {
            [self.delegate onSplashAdFailToLoad:splashAd.placementId error: error];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdFailToLoad");
            }
    }
}

/// 广告曝光回调
/// - Parameter splashAd: WindMillSplashAd 实例对象
-(void)onSplashAdSuccessPresentScreen:(WindMillSplashAd *)splashAd {
    NSLog(@"HJAdsSdkSplash onSplashAdSuccessPresentScreen %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdSuccessPresent)]) {
            [self.delegate onSplashAdSuccessPresent];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdSuccessPresent");
            }
    }
}

/// 广告展示失败回调
/// - Parameters:
///   - splashAd: WindMillSplashAd 实例对象
///   - error: 具体错误信息
-(void)onSplashAdFailToPresent:(WindMillSplashAd *)splashAd withError:(NSError *)error{
    NSLog(@"HJAdsSdkSplash onSplashAdFailToPresent %@ error: %@", NSStringFromSelector(_cmd), error);
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdFailToPresent:error:)]) {
            [self.delegate onSplashAdFailToPresent:splashAd.placementId error: error];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onSplashAdFailToPresent");
        }
    }
}

/// 广告点击回调
/// - Parameter splashAd: WindMillSplashAd 实例对象
- (void)onSplashAdClicked:(WindMillSplashAd *)splashAd{
    NSLog(@"HJAdsSdkSplash onSplashAdClicked %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdClicked)]) {
            [self.delegate onSplashAdClicked];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdClicked");
            }
    }
}

/// 广告跳过回调
/// - Parameter splashAd: WindMillSplashAd 实例对象
- (void)onSplashAdSkiped:(WindMillSplashAd *)splashAd{
    NSLog(@"HJAdsSdkSplash onSplashAdSkiped %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdSkiped)]) {
            [self.delegate onSplashAdSkiped];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdSkiped");
            }
    }
}

/// 广告关闭回调
/// - Parameter splashAd: WindMillSplashAd 实例对象
- (void)onSplashAdClosed:(WindMillSplashAd *)splashAd{
    NSLog(@"HJAdsSdkSplash onSplashAdClosed %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onSplashAdClosed)]) {
            [self.delegate onSplashAdClosed];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onSplashAdClosed");
            }
    }
}

- (void)dealloc {
    NSLog(@"--- dealloc -- %@", self);
    self.splashAd.delegate = nil;
    self.splashAd = nil;
    self.delegate = nil;
}

@end

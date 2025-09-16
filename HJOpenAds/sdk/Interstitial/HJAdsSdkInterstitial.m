#import "HJAdsSdkInterstitial.h"
#import "HuijingAdPreviously.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>
#import "HJAdsRequest.h"



@interface HJAdsSdkInterstitial ()<WindMillIntersititialAdDelegate>
@property (nonatomic, strong) WindMillIntersititialAd *interstitialAd;
@property (nonatomic, strong) NSString *interstitialId;
@end

@implementation HJAdsSdkInterstitial

- (instancetype)initWithRequest:(HJAdsRequest *)request {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.interstitialId = request.placementId;
    HuijingAdPreviously* huijingAdPreviously = [HuijingAdPreviously shareInstance];
    if (huijingAdPreviously.getInterstitialId &&![huijingAdPreviously.getInterstitialId isEqualToString:@""] &&![huijingAdPreviously.getInterstitialId isEqual:[NSNull null]]) {
        if ([huijingAdPreviously.getInterstitialId isEqualToString:request.placementId]) {
            NSLog(@"---- InterstitialAd");
            self.interstitialAd = huijingAdPreviously.getPrevInterstitialAd;
        } else {
            self.interstitialAd = huijingAdPreviously.getPrevFullScreenAd;
        }
    }
    if (self.interstitialAd == nil || !self.interstitialAd.ready) {
        NSLog(@"---- _intersititialAd  initWithChannel");
        self.interstitialAd = [[WindMillIntersititialAd alloc] initWithRequest:req];
    }
    self.interstitialAd.delegate = self;
    return self;
}

- (BOOL)isAdReady {
    return self.interstitialAd && self.interstitialAd.ready;
}

- (void)loadAd {
    if (self.interstitialAd) {
        if (self.interstitialAd.ready) {
            self.interstitialAd.delegate = self;
            if (self.delegate) {
                if ([self.delegate respondsToSelector:@selector( onInterstitialAdLoadSuccess:)]) {
                    [self.delegate onInterstitialAdLoadSuccess:self.interstitialId];
                } else {
                    // 处理可选方法未实现的情况
                    NSLog(@"可选方法未实现 onInterstitialAdLoadSuccess");
                }
            }
        } else {
            [self.interstitialAd loadAdData];
        }
    }
}

- (void)show:(UIViewController *)rootViewController {
    if (self.interstitialAd && self.interstitialAd.ready) {
        [self.interstitialAd showAdFromRootViewController:rootViewController options:nil];
    }
}

#pragma mark - ----- WindMillIntersititialAdDelegate -----
- (void)intersititialAdDidLoad:(WindMillIntersititialAd *)intersititialAd {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( onInterstitialAdLoadSuccess:)]) {
            [self.delegate onInterstitialAdLoadSuccess:intersititialAd.placementId];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onInterstitialAdLoadSuccess");
        }
    }
}

- (void)intersititialAdDidLoad:(WindMillIntersititialAd *)intersititialAd
              didFailWithError:(NSError *)error {
    NSLog(@"HJAdsSdkInterstitial intersititialAdDidLoad didFailWithError %@ error: %@", NSStringFromSelector(_cmd), error);
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdLoadError:error:)]) {
            [self.delegate onInterstitialAdLoadError:intersititialAd.placementId error: error];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onInterstitialAdLoadError");
        }
    }
}

- (void)intersititialAdDidVisible:(WindMillIntersititialAd *)intersititialAd {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdPlayStart)]) {
            [self.delegate onInterstitialAdPlayStart];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onInterstitialAdPlayStart");
        }
    }
}

- (void)intersititialAdDidPlayFinish:(WindMillIntersititialAd *)intersititialAd
                    didFailWithError:(NSError *)error {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdPlayEnd)]) {
            [self.delegate onInterstitialAdPlayEnd];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onInterstitialAdPlayEnd");
        }
    }
}

- (void)intersititialAdDidClick:(WindMillIntersititialAd *)intersititialAd {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdClicked)]) {
            [self.delegate onInterstitialAdClicked];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onInterstitialAdClicked");
            }
    }
}

- (void)intersititialAdDidClickSkip:(WindMillIntersititialAd *)intersititialAd {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdSkiped)]) {
            [self.delegate onInterstitialAdSkiped];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onInterstitialAdSkiped");
            }
    }
}

- (void)intersititialAdDidClose:(WindMillIntersititialAd *)intersititialAd {
    NSLog(@"HJAdsSdkInterstitial %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onInterstitialAdClosed)]) {
            [self.delegate onInterstitialAdClosed];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onInterstitialAdClosed");
            }
    }
}

- (void)dealloc {
    NSLog(@"--- dealloc -- %@", self);
    self.interstitialAd.delegate = nil;
    self.interstitialAd = nil;
    self.delegate = nil;
    self.interstitialId = nil;
}


@end

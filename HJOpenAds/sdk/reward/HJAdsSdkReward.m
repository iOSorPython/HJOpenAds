#import "HJAdsSdkReward.h"
#import "HJStorage.h"
#import "HJAdDto.h"
#import "HuijingAdPreviously.h"
#import "HJAdsSdkInterstitial.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>
#import "HJAdsRequest.h"



@interface HJAdsSdkReward ()<WindMillRewardVideoAdDelegate>
@property (nonatomic, strong) WindMillRewardVideoAd *rewardAd;
@property (nonatomic, strong) HJAdsSdkInterstitial *hjitl;
@property (nonatomic, strong) NSString *rewardId;
@property (nonatomic, strong) UIViewController *rvController;
@end

@implementation HJAdsSdkReward

- (instancetype)initWithRequest:(HJAdsRequest *)request {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.rewardId = request.placementId;
    HuijingAdPreviously* huijingAdPreviously = [HuijingAdPreviously shareInstance];
    self.rewardAd = huijingAdPreviously.getPrevRewardAd;
    if (self.rewardAd == nil || !self.rewardAd.ready) {
        NSLog(@"---- reward  initWithChannel");
        self.rewardAd = [[WindMillRewardVideoAd alloc] initWithRequest:req];
    }
    self.rewardAd.delegate = self;
    return self;
}

- (BOOL)isAdReady {
    return self.rewardAd && self.rewardAd.ready;
}

- (void)loadAd {
    if (self.rewardAd) {
        if (self.rewardAd.ready) {
            self.rewardAd.delegate = self;
            if (self.delegate) {
                if ([self.delegate respondsToSelector:@selector(onVideoAdLoadSuccess:)]) {
                    [self.delegate onVideoAdLoadSuccess:self.rewardId];
                } else {
                    // 处理可选方法未实现的情况
                    NSLog(@"可选方法未实现 onVideoAdLoadSuccess");
                }
            }
        } else {
            [self.rewardAd loadAdData];
        }
    }
}

- (void)show:(UIViewController *)rootViewController options:(NSDictionary<NSString *,NSString *> * _Nullable)options {
    NSLog(@"---- reward  show1");
    if (self.rewardAd && self.rewardAd.ready) {
        NSLog(@"---- reward  show2");
        if (options != nil && [options count] > 0) {
            NSLog(@"---- reward resetRequestOptions");
            [self.rewardAd resetRequestOptions:options];
        }
        [self.rewardAd showAdFromRootViewController:rootViewController options:options];
        self.rvController = rootViewController;
    }
}

#pragma mark - ----- WindMillRewardVideoAdDelegate -----
- (void)rewardVideoAdDidLoad:(WindMillRewardVideoAd *)rewardVideoAd {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdLoadSuccess:)]) {
            [self.delegate onVideoAdLoadSuccess:rewardVideoAd.placementId];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdLoadSuccess");
        }
    }
}

- (void)rewardVideoAdDidLoad:(WindMillRewardVideoAd *)rewardVideoAd didFailWithError:(NSError *)error {
    NSLog(@"HJAdsSdkInterstitial rewardVideoAdDidLoad didFailWithError %@ error: %@", NSStringFromSelector(_cmd), error);
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdLoadError:error:)]) {
            [self.delegate onVideoAdLoadError:rewardVideoAd.placementId error: error];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdLoadError");
        }
    }
}

- (void)rewardVideoAdDidVisible:(WindMillRewardVideoAd *)rewardVideoAd {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    HJStorage *hjStorage = [HJStorage shareInstance];
    HJAdDto *hjAdDto = [hjStorage getStrategy:rewardVideoAd.placementId];
    NSLog(@"___________rewardVideoAdDidVisible______1");
    
    if (hjAdDto != nil && ![hjAdDto isKindOfClass:[NSNull class]]) {
       
        NSString *nAdId = hjAdDto.nAdId;
        NSString *nAdType = hjAdDto.nAdType;
        NSLog(@"___________rewardVideoAdDidVisible______11");
        if (nAdId != nil && ![nAdId isEqual:[NSNull null]] && ![nAdId isEqualToString:@""] &&
            hjAdDto.cpts > 0 && nAdType != nil && ![nAdType isEqual:[NSNull null]] && ![nAdType isEqualToString:@""]) {
            hjStorage.cps++;
            if (hjStorage.cps >= hjAdDto.cpts) {
                hjStorage.cps = 0;
                if ([nAdType isEqualToString:@"3"]) {
                    NSLog(@"___________rewardVideoAdDidVisible______111");
                    HJAdsRequest *request = [HJAdsRequest request];
                    request.placementId = nAdId;
                    self.hjitl = [[HJAdsSdkInterstitial alloc] initWithRequest:request];
                    [self.hjitl loadAd];
                }
            }
        }
    }
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdPlayStart)]) {
            [self.delegate onVideoAdPlayStart];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdPlayStart");
        }
    }
}

- (void)rewardVideoAdDidClick:(WindMillRewardVideoAd *)rewardVideoAd {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdClicked)]) {
            [self.delegate onVideoAdClicked];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdClicked");
        }
    }
}

- (void)rewardVideoAdDidClickSkip:(WindMillRewardVideoAd *)rewardVideoAd {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdSkiped)]) {
            [self.delegate onVideoAdSkiped];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdSkiped");
        }
    }
}

- (void)rewardVideoAdDidClose:(WindMillRewardVideoAd *)rewardVideoAd {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.hjitl != nil && self.hjitl.isAdReady) {
        NSLog(@"HJ-LOG rewardVideoAdDidClose__1 %@", NSStringFromSelector(_cmd));
        [self.hjitl show:self.rvController];
    }
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(onVideoAdClosed)]) {
            [self.delegate onVideoAdClosed];
        } else {
            // 处理可选方法未实现的情况
            NSLog(@"可选方法未实现 onVideoAdClosed");
        }
    }
}

- (void)rewardVideoAdDidPlayFinish:(WindMillRewardVideoAd *)rewardVideoAd didFailWithError:(NSError *)error {
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if (error) {
            if ([self.delegate respondsToSelector:@selector(onVideoAdPlayError:error:)]) {
                [self.delegate onVideoAdPlayError: rewardVideoAd.placementId error: error];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onVideoAdPlayError");
            }
        } else {
            if ([self.delegate respondsToSelector:@selector(onVideoAdPlayEnd)]) {
                [self.delegate onVideoAdPlayEnd];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 onVideoAdPlayEnd");
            }
        }
    }
}

- (void)rewardVideoAd:(nonnull WindMillRewardVideoAd *)rewardVideoAd reward:(nonnull WindMillRewardInfo *)reward { 
    NSLog(@"HJAdsSdkReward %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        [self.delegate onVideoRewarded:reward.transId];
    }
}

- (void)dealloc {
    NSLog(@"--- dealloc -- %@", self);
    self.rewardAd.delegate = nil;
    self.rewardAd = nil;
    self.delegate = nil;
    self.rewardId = nil;
}

@end

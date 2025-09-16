//
//  HJBannerView.m
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/8.
//

#import "HJBannerView.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>
#import "HJAdsRequest.h"

@interface HJBannerView ()<WindMillBannerViewDelegate>
@property (nonatomic, strong) WindMillBannerView *bannerView;
@end

@implementation HJBannerView

- (instancetype)initWithRequest:(HJAdsRequest *)request {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.bannerView = [[WindMillBannerView alloc] initWithRequest:req];
    self.bannerView.delegate = self;
    return self;
}

- (instancetype)initWithRequest:(HJAdsRequest *)request
                     expectSize:(CGSize)expectSize {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.bannerView = [[WindMillBannerView alloc] initWithRequest:req expectSize:expectSize];
    self.bannerView.delegate = self;
    return self;
}

- (void)loadAdData{
    self.bannerView.animated = self.animated;
    self.bannerView.backgroundColor = self.backgroundColor;
    self.bannerView.viewController = self.viewController;
    [self.bannerView loadAdData];
}

- (BOOL)isAdValid {
    return self.bannerView && self.bannerView.isAdValid;
}

- (UIView *)getView {
    return self.bannerView;
}

#pragma mark - ----- WindMillBannerViewDelegate -----

- (void)bannerAdViewDidAutoRefresh:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewDidAutoRefresh %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewDidAutoRefresh:)]) {
            self.adSize = bannerAdView.adSize;
                [self.delegate bannerAdViewDidAutoRefresh:self];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewDidAutoRefresh");
            }
    }
}

- (void)bannerView:(WindMillBannerView *)bannerAdView failedToAutoRefreshWithError:(NSError *)error {
    NSLog(@"HJBannerView failedToAutoRefreshWithError %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerViewFailedToAutoRefreshWithError:)]) {
                [self.delegate bannerViewFailedToAutoRefreshWithError:error];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerViewFailedToAutoRefreshWithError");
            }
    }
}

- (void)bannerAdViewLoadSuccess:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewLoadSuccess %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewLoadSuccess:)]) {
            self.adSize = bannerAdView.adSize;
                [self.delegate bannerAdViewLoadSuccess:self];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewLoadSuccess");
            }
    }
}

- (void)bannerAdViewFailedToLoad:(WindMillBannerView *)bannerAdView
                           error:(NSError *)error {
    NSLog(@"HJBannerView bannerAdViewFailedToLoad error %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewLoadSuccess:)]) {
                [self.delegate bannerAdViewFailedToLoadError:error];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewFailedToLoadError");
            }
    }
}

- (void)bannerAdViewWillExpose:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewWillExpose %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewWillExpose)]) {
                [self.delegate bannerAdViewWillExpose];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewWillExpose");
            }
    }
}

- (void)bannerAdViewDidClicked:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewDidClicked %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewWillExpose)]) {
                [self.delegate bannerAdViewDidClicked];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewDidClicked");
            }
    }
}

- (void)bannerAdViewWillLeaveApplication:(WindMillBannerView *)bannerAdView{
    NSLog(@"HJBannerView bannerAdViewWillLeaveApplication %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewWillLeaveApplication)]) {
                [self.delegate bannerAdViewWillLeaveApplication];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewWillLeaveApplication");
            }
    }
}

- (void)bannerAdViewWillOpenFullScreen:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewWillOpenFullScreen %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewWillOpenFullScreen)]) {
                [self.delegate bannerAdViewWillOpenFullScreen];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewWillOpenFullScreen");
            }
    }
}

/// 将关闭全屏视图。关闭storekit或关闭应用程序中的网页时发送
/// - Parameter bannerAdView: WindMillBannerView 实例对象
- (void)bannerAdViewCloseFullScreen:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewCloseFullScreen %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewCloseFullScreen)]) {
                [self.delegate bannerAdViewCloseFullScreen];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewCloseFullScreen");
            }
    }
}

- (void)bannerAdViewDidRemoved:(WindMillBannerView *)bannerAdView {
    NSLog(@"HJBannerView bannerAdViewDidRemoved %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( bannerAdViewDidRemoved)]) {
                [self.delegate bannerAdViewDidRemoved];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 bannerAdViewDidRemoved");
            }
    }
}

- (void)dealloc {
    NSLog(@"--- dealloc -- %@", self);
    self.bannerView.delegate = nil;
    self.bannerView = nil;
    self.delegate = nil;
}

@end

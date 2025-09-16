//
//  HJNativeAdsManager.m
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/8.
//
#import "HJNativeAdsManager.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>
#import "HJAdsRequest.h"
#import "HJNativeAd.h"

@interface HJNativeAdsManager ()<WindMillNativeAdsManagerDelegate>
@property (nonatomic, strong) WindMillNativeAdsManager *nativeAdsManager;
@end

@implementation HJNativeAdsManager

- (instancetype)initWithRequest:(HJAdsRequest *)request {
    WindMillAdRequest *req = [WindMillAdRequest request];
    req.placementId = request.placementId;
    req.userId = request.userId;
    req.options = request.options;
    self.nativeAdsManager = [[WindMillNativeAdsManager alloc] initWithRequest:req];
    self.nativeAdsManager.delegate = self;
    return self;
}

- (void)loadAdDataWithCount:(NSInteger)count {
    if (self.adSize.width != 0 && self.adSize.height != 0 && self.nativeAdsManager) {
        self.nativeAdsManager.adSize = CGSizeMake(self.adSize.width, self.adSize.height);
        [self.nativeAdsManager loadAdDataWithCount:count];
    }
}

- (NSArray<HJNativeAd *> * _Nullable)getAllNativeAds {
    NSArray<WindMillNativeAd *> *nativeAdList = [self.nativeAdsManager getAllNativeAds];
    if (nativeAdList.count == 0) return @[];
    NSMutableArray *array = [NSMutableArray array];
    for (id nativeAd in nativeAdList) {
        HJNativeAd *ad = [[HJNativeAd alloc] initWithAd: nativeAd];
        [array addObject:ad];
    }
    return [array copy];
}

#pragma mark - ----- WindMillNativeAdsManagerDelegate -----


- (void)nativeAdsManagerSuccessToLoad:(WindMillNativeAdsManager *)adsManager {
    NSLog(@"HJNativeAdsManager nativeAdsManagerSuccessToLoad %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( nativeAdsManagerSuccessToLoad:)]) {
                [self.delegate nativeAdsManagerSuccessToLoad:self];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 nativeAdsManagerSuccessToLoad");
            }
    }
}

- (void)nativeAdsManager:(WindMillNativeAdsManager *)adsManager didFailWithError:(NSError *)error {
    NSLog(@"HJNativeAdsManager nativeAdsManager didFailWithError %@", NSStringFromSelector(_cmd));
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector( nativeAdsManagerdidFailWithError:)]) {
                [self.delegate nativeAdsManagerdidFailWithError:error];
            } else {
                // 处理可选方法未实现的情况
                NSLog(@"可选方法未实现 nativeAdsManagerdidFailWithError");
            }
    }
}

//- (void)dealloc {
//    NSLog(@"--- dealloc -- %@", self);
//    self.nativeAdsManager.delegate = nil;
//    self.nativeAdsManager = nil;
//    self.delegate = nil;
//}


@end

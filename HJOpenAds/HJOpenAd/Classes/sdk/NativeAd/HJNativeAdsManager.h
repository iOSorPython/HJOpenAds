//
//  HJNativeAdsManager.h
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/8.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HJAdsRequest;
@class HJNativeAd;
@class HJNativeAdsManager;

NS_ASSUME_NONNULL_BEGIN
@protocol HJNativeAdsManagerDelegate <NSObject>

@optional
- (void)nativeAdsManagerSuccessToLoad:(HJNativeAdsManager *)nativeAdsManager;
- (void)nativeAdsManagerdidFailWithError:(NSError *)error;

@end


@interface HJNativeAdsManager : NSObject

@property (nonatomic, weak) id<HJNativeAdsManagerDelegate> delegate;

@property (nonatomic, assign, readwrite) CGSize adSize;

- (instancetype)initWithRequest:(HJAdsRequest *)request;

- (void)loadAdDataWithCount:(NSInteger)count;

- (NSArray<HJNativeAd *> * _Nullable)getAllNativeAds;

@end

NS_ASSUME_NONNULL_END

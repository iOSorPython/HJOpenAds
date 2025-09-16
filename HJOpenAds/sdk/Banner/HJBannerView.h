//
//  HJBannerView.h
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HJAdsRequest;
@class HJBannerView;

NS_ASSUME_NONNULL_BEGIN

@protocol HJBannerViewDelegate <NSObject>

@optional

- (void)bannerAdViewDidAutoRefresh:(HJBannerView *)bannerAdView;

- (void)bannerViewFailedToAutoRefreshWithError:(NSError *)error;

- (void)bannerAdViewLoadSuccess:(HJBannerView *)bannerAdView;

- (void)bannerAdViewFailedToLoadError:(NSError *)error;

- (void)bannerAdViewWillExpose;

- (void)bannerAdViewDidClicked;

- (void)bannerAdViewWillLeaveApplication;

- (void)bannerAdViewWillOpenFullScreen;
- (void)bannerAdViewCloseFullScreen;
- (void)bannerAdViewDidRemoved;
@end

@interface HJBannerView : NSObject

@property (nonatomic, weak) id<HJBannerViewDelegate> delegate;

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic) BOOL animated;

@property (nonatomic, assign) CGSize adSize;
@property(nullable, nonatomic,copy) UIColor *backgroundColor;

- (instancetype)initWithRequest:(HJAdsRequest *)request;

- (instancetype)initWithRequest:(HJAdsRequest *)request
                     expectSize:(CGSize)expectSize;

- (void)loadAdData;
- (BOOL)isAdValid;
- (UIView *)getView;
@end
NS_ASSUME_NONNULL_END

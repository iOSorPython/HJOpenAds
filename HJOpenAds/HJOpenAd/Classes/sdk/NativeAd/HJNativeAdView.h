//
//  HJNativeAdView.h
//
//  Created by 胡兵 on 2024/5/27.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HJNativeAdView;
@class HJNativeAd;
@protocol HJNativeAdViewDelegate <NSObject>
@optional
- (void)nativeExpressAdViewRenderSuccess:(HJNativeAdView *)nativeExpressAdView;
- (void)nativeExpressAdViewRenderFail:(NSError *)error;
- (void)nativeAdViewWillExpose;
- (void)nativeAdViewDidClick;
- (void)dislikeWithReason:(NSString *) reason;

@end
@interface HJNativeAdView : NSObject
+ (instancetype) initAdView;

@property(nonatomic) CGRect frame;
@property (nonatomic, weak) id<HJNativeAdViewDelegate> delegate;
@property (nonatomic, weak) UIViewController *viewController;
- (void)refreshData:(HJNativeAd *)nativeAd;
- (UIView *)getView;
@end

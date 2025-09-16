#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HJAdsRequest;
@protocol HJInterstitialAdDelegate <NSObject>
@optional
-(void) onInterstitialAdLoadSuccess:(NSString *) placementId;
-(void) onInterstitialAdLoadError:(NSString *) placementId error:(NSError *)error;
-(void) onInterstitialAdPlayStart;
-(void) onInterstitialAdPlayEnd;
-(void) onInterstitialAdClicked;
-(void) onInterstitialAdClosed;
-(void) onInterstitialAdSkiped;

@end

@interface HJAdsSdkInterstitial : NSObject
/// 广告代理对象
@property (nonatomic, weak) id<HJInterstitialAdDelegate> delegate;

- (instancetype)initWithRequest:(HJAdsRequest *)request;
- (BOOL)isAdReady;
- (void)loadAd;
- (void)show:(UIViewController *)rootViewController;
@end

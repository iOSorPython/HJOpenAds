#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HJAdsRequest;
@protocol HJSplashAdDelegate <NSObject>
@optional
-(void) onSplashAdSuccessPresent;
-(void) onSplashAdFailToPresent:(NSString *) placementId error:(NSError *)error;
-(void) onSplashAdSuccessLoad:(NSString *) placementId;
-(void) onSplashAdFailToLoad:(NSString *) placementId error:(NSError *)error;
-(void) onSplashAdClicked;
-(void) onSplashAdClosed;
-(void) onSplashAdSkiped;

@end

@interface HJAdsSdkSplash : NSObject
/// 广告代理对象
@property (nonatomic, weak) id<HJSplashAdDelegate> delegate;
@property (nonatomic, weak) UIViewController *rootViewController;

- (instancetype)initWithRequest:(HJAdsRequest *)request
                              extra:(NSDictionary * _Nullable)extra;
- (instancetype)initWithRequest:(HJAdsRequest *)request;
- (BOOL)isAdReady;
-(void)loadAdAndShow;
- (void)loadAd;
- (void)showAdInWindow:(UIWindow *)window;
@end

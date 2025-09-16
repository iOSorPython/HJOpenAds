#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HJAdsRequest;
@protocol HJRewardAdDelegate <NSObject>

@required

-(void) onVideoRewarded:(NSString *_Nonnull) transId;

@optional
-(void) onVideoAdLoadSuccess:(NSString *) placementId;
-(void) onVideoAdLoadError:(NSString *) placementId error:(NSError *)error;
-(void) onVideoAdPlayStart;
-(void) onVideoAdPlayEnd;
-(void) onVideoAdClicked;
-(void) onVideoAdClosed;
-(void) onVideoAdSkiped;
-(void) onVideoAdPlayError:(NSString *) placementId error:(NSError *)error;

@end

@interface HJAdsSdkReward : NSObject
/// 广告代理对象
@property (nonatomic, weak) id<HJRewardAdDelegate> delegate;

- (instancetype)initWithRequest:(HJAdsRequest *)request;
- (BOOL)isAdReady;
- (void)loadAd;
- (void)show:(UIViewController *)rootViewController options:(NSDictionary<NSString *, NSString *> * _Nullable)options;
@end

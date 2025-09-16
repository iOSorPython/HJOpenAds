#import "HJAdsSdk.h"
#import "HJAdSdkHttp.h"
#import "HuijingAdPreviously.h"
#import <WindMillSDK/WindMillSDK.h>

@interface HJAdsSdk ()

@end

@implementation HJAdsSdk
static HJAdsSdk* _instance = nil;

+(instancetype) sharedAds
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
     
    return _instance ;
}
 
+(id) allocWithZone:(struct _NSZone *)zone
{
    return [HJAdsSdk sharedAds] ;
}
 
-(id) copyWithZone:(struct _NSZone *)zone
{
    return [HJAdsSdk sharedAds] ;
}
-(void)setupSDKWithAppId:(NSString *)appId
{
    [WindMillAds setupSDKWithAppId:appId];
    [HJAdSdkHttp queryConfig:appId];
}

-(void)setDebugEnable:(BOOL)enable
{
    [WindMillAds setDebugEnable:enable];
}

-(void) startAdPreviously:(NSString *)rewardId interstitialId:(NSString *)interstitialId fullScreenId:(NSString *)fullScreenId userId:(NSString *)userId
{
    HuijingAdPreviously* huijingAdPreviously = [HuijingAdPreviously shareInstance];
    [huijingAdPreviously startAdPreviously:rewardId interstitialId:interstitialId fullScreenId:fullScreenId userId:userId];
}
@end

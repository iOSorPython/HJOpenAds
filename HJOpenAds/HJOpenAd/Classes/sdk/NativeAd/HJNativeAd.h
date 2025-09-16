//
//  HJNativeAd.h
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/7.
//

#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>

@interface HJNativeAd : NSObject
- (instancetype)initWithAd:(WindMillNativeAd *) ad;
- (WindMillNativeAd *)getAd;
@end

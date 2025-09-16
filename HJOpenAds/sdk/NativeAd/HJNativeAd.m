//
//  HJNativeAd.m
//  HJOpenAds
//
//  Created by 胡兵 on 2024/6/7.
//

#import "HJNativeAd.h"
#import <Foundation/Foundation.h>
#import <WindMillSDK/WindMillSDK.h>

@interface HJNativeAd ()
@property (nonatomic, strong) WindMillNativeAd *nativeAd;
@end

@implementation HJNativeAd

- (instancetype)initWithAd:(WindMillNativeAd *) ad {
    self = [super init];
        if (self) {
            _nativeAd = ad;
        }
        return self;
}

- (WindMillNativeAd *)getAd {
    return self.nativeAd;
}

@end

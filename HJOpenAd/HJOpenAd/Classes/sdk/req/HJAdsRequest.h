//
//  HJAdsRequest.h
//  HjH5
//
//  Created by 胡兵 on 2024/5/27.
//
#import <Foundation/Foundation.h>

@interface HJAdsRequest : NSObject

// 【可选】，媒体用户ID。
@property (nonatomic,copy) NSString *userId;

// 【比传】，广告位ID。
@property (nonatomic,copy) NSString *placementId;

// 【可选】，服务端激励回传时，透传参数。
@property (nonatomic,strong) NSDictionary<NSString *, NSString *> *options;

+ (instancetype)request;



@end

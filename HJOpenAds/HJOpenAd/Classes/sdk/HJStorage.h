#import "HJAdDto.h"
#import <Foundation/Foundation.h>

@interface HJStorage : NSObject
@property (nonatomic) int cps;
+(instancetype) shareInstance;
-(void) addStrategyDtos:(NSString *)adsId hjAdDto:(HJAdDto *) hjAdDto;
-(HJAdDto *) getStrategy: (NSString *)adsId;
@end



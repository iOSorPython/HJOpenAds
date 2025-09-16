#import "HJStorage.h"
#import "HJAdDto.h"

@interface HJStorage ()

@property (nonatomic, strong) NSMutableDictionary *strategyDict;
@end

@implementation HJStorage

static HJStorage* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
        _instance.strategyDict = [NSMutableDictionary dictionary];
    }) ;
     
    return _instance ;
}
 
+(id) allocWithZone:(struct _NSZone *)zone
{
    return [HJStorage shareInstance] ;
}
 
-(id) copyWithZone:(struct _NSZone *)zone
{
    return [HJStorage shareInstance] ;
}

-(void) addStrategyDtos:(NSString *)adsId hjAdDto:(HJAdDto *) hjAdDto
{
    self.strategyDict[adsId] = hjAdDto;
}

-(HJAdDto *) getStrategy: (NSString *)adsId
{
    return self.strategyDict[adsId];
}

@end

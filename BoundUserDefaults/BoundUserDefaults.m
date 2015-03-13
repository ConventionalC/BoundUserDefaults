#import "BoundUserDefaults.h"

@interface BoundUserDefaults()<DynamicPropertyResolverDelegate>
@end

@implementation BoundUserDefaults
{
    DynamicPropertyResolver *_dynamicPropertyResolver;
}

-(DynamicPropertyResolver*)dynamicPropertyResolver
{
    if(!_dynamicPropertyResolver)
    {
        _dynamicPropertyResolver = DynamicPropertyResolver.new;
        _dynamicPropertyResolver.delegate = self;
    }
    return _dynamicPropertyResolver;
}

-(NSUserDefaults*)userDefaults
{
    return _userDefaults ?: NSUserDefaults.standardUserDefaults;
}

-(id)getDynamicProperty:(NSString*)propertyName
{
    return [self.userDefaults objectForKey:propertyName];
}

-(void)setDynamicProperty:(NSString*)propertyName value:(id)value
{
    [self.userDefaults setObject:value forKey:propertyName];
    [self.userDefaults synchronize];
}

+(BOOL)resolveInstanceMethod:(SEL)aSEL
{
    return [DynamicPropertyResolver resolveInstanceMethod:aSEL];
}

@end
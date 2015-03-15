#import "BoundUserDefaults.h"
#import "DynamicPropertyResolver.h"

@implementation BoundUserDefaults
{
    DynamicPropertyResolver *_dynamicPropertyResolver;
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

@end
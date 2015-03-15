#import <Foundation/Foundation.h>

@interface DynamicPropertyResolver : NSObject
    // override these
    -(id)getDynamicProperty:(NSString*)propertyName;
    -(void)setDynamicProperty:(NSString*)propertyName value:(id)value;
@end

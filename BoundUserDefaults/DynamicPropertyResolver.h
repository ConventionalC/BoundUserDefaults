#import <BoundUserDefaults/BoundUserDefaults.h>

@protocol DynamicPropertyResolverDelegate<NSObject>
    -(id)getDynamicProperty:(NSString*)propertyName;
    -(void)setDynamicProperty:(NSString*)propertyName value:(id)value;
@end

@interface DynamicPropertyResolver : NSObject
    @property(nonatomic, weak) id<DynamicPropertyResolverDelegate> delegate;

    // resolveInstanceMethod must be called by the same method in a parent object.
    +(BOOL)resolveInstanceMethod:(SEL)aSEL;
@end

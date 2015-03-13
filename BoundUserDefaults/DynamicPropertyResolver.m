#import "DynamicPropertyResolver.h"
#import <objc/runtime.h>

@implementation DynamicPropertyResolver

//TODO: there should be a better way to get from a setter name to a property
+(NSString*)stripSet:(NSString*)s //remove ^set
{
    NSString *method = [s substringFromIndex:3];
    method = [method substringToIndex:method.length - 1]; //remove :$
    method = [method stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[method substringToIndex:1].lowercaseString];
    return method;
}

id getIMP(DynamicPropertyResolver *self, SEL cmd);
id getIMP(DynamicPropertyResolver *self, SEL cmd)
{
    return [self.delegate getDynamicProperty:NSStringFromSelector(cmd)];
}

//TODO pass property name instead of calculating it again
void setIMP(DynamicPropertyResolver *self, SEL cmd, id obj)
{
    return [self.delegate setDynamicProperty:[DynamicPropertyResolver stripSet:NSStringFromSelector(cmd)] value:obj];
}

+(NSString*)typeNameStringForProperty:(NSString*)propertyName inClass:(Class)c
{
    objc_property_t property = class_getProperty(c, propertyName.UTF8String);
    if(!property) return nil;
    const char * attrs = property_getAttributes( property );
    if ( attrs == NULL )
        return ( NULL );
    
    static char buffer[256];
    const char * e = strchr( attrs, ',' );
    if ( e == NULL )
        return ( NULL );
    
    int len = (int)(e - attrs);
    memcpy( buffer, attrs, len );
    buffer[len] = '\0';
    
    return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

#pragma mark - Meta

+(BOOL)resolveInstanceMethod:(SEL)aSEL
{
    NSString *property = NSStringFromSelector(aSEL);
    BOOL isSet = [property hasPrefix:@"set"];
    if(isSet) property = [self stripSet:property];
    //TODO: this could be generisized for all primitives
    BOOL isDouble = [@"Td" isEqualToString:[self typeNameStringForProperty:property inClass:self.class]];
    
    IMP imp;
    const char* types;
    
    
    if(isSet)
    {
        imp = (IMP)setIMP;
        types = "v@:"; //TODO: use @encode() instead
    }
    else
    {
        imp = (IMP)getIMP;
        types = isDouble ? "d@:@" : "@@:@"; //TODO: use @encode() instead
    }
    
    class_addMethod(self.class, aSEL, imp, types);
    
    return YES;
}

#pragma mark - Key Value Coding

-(id)valueForKey:(NSString*)key
{
    return [self.delegate getDynamicProperty:key];
}

-(void)setValue:(id)value forKey:(NSString*)key
{
    [self.delegate setDynamicProperty:key value:value];
}

@end

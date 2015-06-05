#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double BoundUserDefaultsVersionNumber;
FOUNDATION_EXPORT const unsigned char BoundUserDefaultsVersionString[];

//#import <BoundUserDefaults/DynamicPropertyResolver.h>
#import "DynamicPropertyResolver.h"

@interface BoundUserDefaults : DynamicPropertyResolver
    // Defaults to NSUserDefaults.standardUserDefaults
    @property(nonatomic, retain) NSUserDefaults *userDefaults;
@end
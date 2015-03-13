#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double BoundUserDefaultsVersionNumber;
FOUNDATION_EXPORT const unsigned char BoundUserDefaultsVersionString[];

#import <BoundUserDefaults/DynamicPropertyResolver.h>

@interface BoundUserDefaults: NSObject
    //Defaults to NSUserDefaults.standardUserDefaults
    @property(nonatomic, retain) NSUserDefaults *userDefaults;
@end
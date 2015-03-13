#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <BoundUserDefaults/BoundUserDefaults.h>

@interface BoundUserDefaultsTests : XCTestCase
@end

@interface TestBoundDefaults : BoundUserDefaults
    @property(nonatomic, assign) NSString *testString;
@end

@implementation BoundUserDefaultsTests

+(void)setUp
{
    [super setUp];
    [NSUserDefaults resetStandardUserDefaults];
}

-(void)testBoundUserDefaults
{
    TestBoundDefaults *defaults = TestBoundDefaults.new;
    XCTAssertEqualObjects(defaults.userDefaults, NSUserDefaults.standardUserDefaults);
    XCTAssertNil(defaults.testString);
    defaults.testString = @"Test Value";
    XCTAssertEqualObjects(@"Test Value", defaults.testString);
}

-(void)testBoundUserDefaultsPerformance
{
    TestBoundDefaults *defaults = TestBoundDefaults.new;
    [self measureBlock:^{
        for(int i=0; i<1000; i++)
            defaults.testString = @"Test Value";
    }];
}

@end

@implementation TestBoundDefaults
@end
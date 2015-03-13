#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <BoundUserDefaults/BoundUserDefaults.h>

@interface BoundUserDefaultsTests : XCTestCase
@end

@interface TestBoundDefaults : BoundUserDefaults
    @property(nonatomic, assign) NSString *testString;
    @property(nonatomic, assign) double    testDouble;
@end

@implementation BoundUserDefaultsTests

+(void)setUp
{
    [super setUp];
    [NSUserDefaults resetStandardUserDefaults];
    [NSUserDefaults.standardUserDefaults setObject:nil forKey:@"testString"];
}

-(void)testBoundUserDefaults
{
    TestBoundDefaults *defaults = TestBoundDefaults.new;
    XCTAssertEqualObjects(defaults.userDefaults, NSUserDefaults.standardUserDefaults);
    XCTAssertNil(defaults.testString);
    defaults.testString = @"Test Value";
    XCTAssertEqualObjects(@"Test Value", defaults.testString);
    XCTAssertEqualObjects(@"Test Value", [NSUserDefaults.standardUserDefaults objectForKey:@"testString"]);
//    defaults.testDouble = 0.383;
//    XCTAssertEqual(0.383, defaults.testDouble);
//    XCTAssertEqual(0.383, [NSUserDefaults.standardUserDefaults doubleForKey:@"testDouble"]);
}

@end

@implementation TestBoundDefaults
    @dynamic testString, testDouble;
@end
//
// Licensed under the terms in License.txt
//
// Copyright 2012 Stewart Gleadow (sgleadow@gmail.com). All rights reserved.
//

#import "Kiwi.h"
#import "KiwiTestConfiguration.h"
#import "TestClasses.h"

#if KW_TESTS_ENABLED

@interface KWNonEmptyCollectionMatcherTest : SenTestCase

@end

@implementation KWNonEmptyCollectionMatcherTest

- (void)testItShouldHaveTheRightMatcherStrings {
    NSArray *matcherStrings = [KWBeNonEmptyMatcher matcherStrings];
    NSArray *expectedStrings = [NSArray arrayWithObject:@"beNonEmpty"];
    STAssertEqualObjects([matcherStrings sortedArrayUsingSelector:@selector(compare:)],
                         [expectedStrings sortedArrayUsingSelector:@selector(compare:)],
                         @"expected specific matcher strings");
}

- (void)testItShouldMatchNonEmptyCollections {
    id subject = [NSArray arrayWithObject:@"an item"];
    id matcher = [KWBeNonEmptyMatcher matcherWithSubject:subject];
    [matcher beNonEmpty];
    STAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldNotMatchEmptyCollections {
    id subject = [NSArray array];
    id matcher = [KWBeNonEmptyMatcher matcherWithSubject:subject];
    [matcher beNonEmpty];
    STAssertFalse([matcher evaluate], @"expected negative match");
}

- (void)testItShouldNotMatchNilCollections {
    id subject = nil;
    id matcher = [KWBeNonEmptyMatcher matcherWithSubject:subject];
    [matcher beNonEmpty];
    STAssertFalse([matcher evaluate], @"expected negative match");
}

- (void)testItShouldHaveHumanReadableDescription
{
    id matcher = [KWBeNonEmptyMatcher matcherWithSubject:nil];
    STAssertEqualObjects(@"be non empty", [matcher description], @"description should match");
}

@end

#endif // #if KW_TESTS_ENABLED

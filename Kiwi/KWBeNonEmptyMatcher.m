//
// Licensed under the terms in License.txt
//
// Copyright 2012 Stewart Gleadow (sgleadow@gmail.com). All rights reserved.
//

#import "KWBeNonEmptyMatcher.h"
#import "KWFormatter.h"

@implementation KWBeNonEmptyMatcher

#pragma mark -
#pragma mark Properties

#pragma mark -
#pragma mark Getting Matcher Strings

+ (NSArray *)matcherStrings {
    return [NSArray arrayWithObject:@"beNonEmpty"];
}

#pragma mark -
#pragma mark Matching

- (BOOL)evaluate {
    if (self.subject == nil) {
        return NO;
    }
    else if ([self.subject respondsToSelector:@selector(count)]) {
        return [self.subject count] > 0;
    }
    else if ([self.subject respondsToSelector:@selector(length)]) {
        return [self.subject count] > 0;
    }
    
    [NSException raise:@"KWMatcherException" format:@"subject does not respond to -count or -length"];
    return NO;
}

#pragma mark -
#pragma mark Getting Failure Messages

- (NSString *)failureMessageForShould {
    return [NSString stringWithFormat:@"expected subject to be non empty"];
}

- (NSString *)failureMessageForShouldNot {
    return @"expected subject to be empty";
}

- (NSString *)description
{
    return @"be non empty";
}

#pragma mark -
#pragma mark Configuring Matchers

- (void)beNonEmpty {
}

@end

//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "KiwiConfiguration.h"
#import "KWBlockNode.h"
#import "KWExampleNode.h"

@class KWPendingNode;
@class KWExample;
@class KWContextNode;

@interface KWItNode : KWBlockNode<KWExampleNode> {
  KWContextNode *context;
}

@property (nonatomic, assign) KWExample *example;
@property (nonatomic, retain, readonly) KWContextNode *context;

#pragma mark -
#pragma mark Initializing

+ (id)itNodeWithCallSite:(KWCallSite *)aCallSite 
             description:(NSString *)aDescription 
                 context:(KWContextNode *)context 
                   block:(KWVoidBlock)aBlock;

@end

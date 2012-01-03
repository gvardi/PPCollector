//
//  PPCollectorTest.m
//  PPCollectorTest
//
//  Created by Meirav Vardi on 11/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PPCollectorTest.h"


@implementation PPCollectorTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    PPCollector *collector = [[PPCollector alloc]initWithKey:@"guy"];
    [collector trackLevel:0 score:0];
    STAssertNotNil(collector, @"collector in  nill");
}

@end

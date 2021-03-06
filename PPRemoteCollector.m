//
//  PPRemoteCollector.m
//  AdDemo
//
//  Created by Meirav Vardi on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PPRemoteCollector.h"


@implementation PPRemoteCollector

@synthesize remoteCollectorAPI;


- (id)initWithKey:(NSString *)key
{
    self = [super init];
    if (self) {
        remoteCollectorAPI = [MixpanelAPI sharedAPIWithToken:key];
    }
    [self trackSession];
    return self;
}

- (void) setFlush:(NSInteger) interval
{
    self.remoteCollectorAPI.uploadInterval = interval;
    
}

- (void) trackSession
{
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Session Start"];
}


- (void) trackStartLevel:(NSInteger)level
{
    
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Level Start"
                properties:[NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:level], @"level",[NSNumber numberWithInt:0], @"score", nil]
     ];
    
}


- (void) trackLevel:(NSInteger)level score:(NSInteger)score
{
    
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Level End"
         properties:[NSDictionary dictionaryWithObjectsAndKeys:
                     [NSNumber numberWithInt:level], @"level",[NSNumber numberWithInt:score], @"score", nil]
     ];

}

- (void) trackTopup:(NSInteger)amount 
{
    
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Topup"
                properties:[NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:amount], @"amount", nil]
     ];
    
}

- (void) trackPurchaceOfItem:(NSString *)item quantity:(NSInteger)quantity amount:(NSInteger)amount
{
    
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Purchace Item"
                properties:[NSDictionary dictionaryWithObjectsAndKeys:
                            item, @"item",[NSNumber numberWithInt:quantity], @"quantity", 
                            [NSNumber numberWithInt:amount], @"amount", nil]
     ];
    
}

- (void) trackKey:(NSString *)key value:(NSString *)value
{
    
    MixpanelAPI *remoteCollector = [MixpanelAPI sharedAPI];
    
	[remoteCollector track:@"Key Value"
                properties:[NSDictionary dictionaryWithObjectsAndKeys:
                            key, @"key",value, @"value", nil]
     ];
    
}



- (void) flush
{
    [[MixpanelAPI sharedAPI] flush];   
}

- (void)dealloc
{
    [super dealloc];
}

@end

//
//  PPCollector.m
//  AdDemo
//
//  Created by Meirav Vardi on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PPCollector.h"
static PPCollector *sharedInstance = nil;

@implementation PPCollector

@synthesize remoteCollector;




+ (id)sharedCollectorWithKey:(NSString *)key
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            [[self alloc] initWithKey:key];
        }
    }
    
    return sharedInstance;
}

+ (id)sharedCollector
{
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    
    return nil;
}



- (id)copyWithZone:(NSZone *)zone
{
    return self;
}


- (id)initWithKey:(NSString *)key
{
    self = [super init];
    if (self) {
        remoteCollector = [[PPRemoteCollector alloc] initWithKey:key];
    }
    return self;
}

- (void) trackStartLevel:(NSInteger)level
{
    [self.remoteCollector trackStartLevel:level];
    
}

- (void) trackLevel:(NSInteger)level score:(NSInteger)score
{
    [self.remoteCollector trackLevel:level score:score];

}

- (void) setFlush:(NSInteger) interval
{
    [self.remoteCollector setFlush:interval];
    
}


- (void) trackTopup:(NSInteger)amount
{
    [self.remoteCollector trackTopup:amount]; 
}


- (void) trackPurchaceOfItem:(NSString *)item quantity:(NSInteger)quantity amount:(NSInteger)amount;
{
    [self.remoteCollector trackPurchaceOfItem:item quantity:quantity amount:amount];
}


- (void) trackKey:(NSString *)key value:(NSString *)value
{
    [self.remoteCollector trackKey:key value:value]; 
}


- (void) flush
{
    [self.remoteCollector flush];
}




- (void)dealloc
{
    [remoteCollector release];
    [super dealloc];
}

@end

int ppSharedCollector(const char * key)
{
    NSString *token = [NSString stringWithUTF8String:key];
    [[PPCollector sharedCollectorWithKey:token] trackLevel:0 score:0];
    return 0;
    
    
}

int ppSetFlushInterval(int interval)
{
    [[PPCollector sharedCollector] setFlush:interval];
    return 0;
}

int ppTrackStartLevel(int level)
{
    [[PPCollector sharedCollector] trackStartLevel:level];
    return 0;
}


int ppTrackLevel(int level, int score)
{
    [[PPCollector sharedCollector] trackLevel:level score:score];
    return 0;
}

int ppTrackTopup(int amount)
{
    [[PPCollector sharedCollector] trackTopup:amount];
    return 0;
}

int ppTrackPurchaceOfItem(const char * item, int quantity, int amount)
{
    NSString *itemName = [NSString stringWithUTF8String:item];
    [[PPCollector sharedCollector] trackPurchaceOfItem:itemName quantity:quantity amount:amount];
    return 0;
}

int ppTrackKeyValue(const char  * key, const char  * value)
{
    NSString *keyName = [NSString stringWithUTF8String:key];
    NSString *valueName = [NSString stringWithUTF8String:value];
    [[PPCollector sharedCollector] trackKey:keyName value:valueName];
    return 0;
}

int ppFlush()
{
    [[PPCollector sharedCollector] flush];
    return 0;
}

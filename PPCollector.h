//
//  PPCollector.h
//  AdDemo
//
//  Created by Meirav Vardi on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPRemoteCollector.h"


@interface PPCollector : NSObject {
@private
    
}
@property (retain) PPRemoteCollector *remoteCollector;


+ (id) sharedCollectorWithKey:(NSString *)key;
+ (id) sharedCollector;
- (void) setFlush:(NSInteger)flush;
- (void) trackStartLevel:(NSInteger)level;
- (void) trackLevel:(NSInteger)level score:(NSInteger)score;
- (void) trackTopup:(NSInteger)amount;
- (void) trackPurchaceOfItem:(NSString *)item quantity:(NSInteger)quantity amount:(NSInteger)amount;
- (void) trackKey:(NSString *)key value:(NSInteger)value;
- (void) flush;

@end

int ppSharedCollector(const char * key);
int ppSetFlushInterval(int interval);
int ppTrackStartLevel(int level);
int ppTrackLevel(int level, int score);
int ppTrackTopup(int amount);
int ppTrackPurchaceOfItem(const char * item, int quantity, int amount);
int ppTrackKeyValue(const char  * key, int value);
int pptFlush();


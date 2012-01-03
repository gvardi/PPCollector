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
- (void) trackLevel:(NSInteger)level score:(NSInteger)score;
- (void) trackTopup:(NSInteger)amount;
- (void) trackPurchaceOfItem:(NSString *)item quantity:(NSInteger)quantity amount:(NSInteger)amount;
- (void) trackKey:(NSString *)key value:(NSInteger)value;
- (void) flush;

@end

int sharedCollectorWithKey_platform(const char * key);
int trackLevelScore_platform(int level, int score);
int trackTopup(int amount);
int trackPurchaceOfItem(const char * item, int quantity, int amount);
int trackKeyValue(const char  * key, int value);


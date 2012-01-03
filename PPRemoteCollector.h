//
//  PPRemoteCollector.h
//  AdDemo
//
//  Created by Meirav Vardi on 11/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixpanelAPI.h"


@interface PPRemoteCollector : NSObject {
@private
    
}
@property (retain) MixpanelAPI *remoteCollectorAPI;


- (id) initWithKey:(NSString *)key;
- (void) setFlush:(NSInteger)flush;
- (void) trackSession;
- (void) trackStartLevel:(NSInteger)level;
- (void) trackLevel:(NSInteger)level score:(NSInteger)score;
- (void) trackTopup:(NSInteger)amount;
- (void) trackPurchaceOfItem:(NSString *)item quantity:(NSInteger)quantity amount:(NSInteger)amount;
- (void) trackKey:(NSString *)key value:(NSInteger)value;
- (void) flush;



@end

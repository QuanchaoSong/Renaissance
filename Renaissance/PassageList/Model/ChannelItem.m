//
//  ChannelItem.m
//  Renaissance
//
//  Created by Albus on 2019/2/6.
//  Copyright © 2019 Albus. All rights reserved.
//

#import "ChannelItem.h"

@implementation ChannelItem

- (BOOL)isCoverUrlValid {
    if (self.coverUrl.length > 0) {
        if ([self.coverUrl hasPrefix:@"http"] || [self.coverUrl hasPrefix:@"ftp"]) {
            return YES;
        }
    }
    
    return NO;
}

@end

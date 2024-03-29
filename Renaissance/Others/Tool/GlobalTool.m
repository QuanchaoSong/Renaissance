//
//  GlobalTool.m
//  Renaissance
//
//  Created by Albus on 2019/2/6.
//  Copyright © 2019 Albus. All rights reserved.
//

#import "GlobalTool.h"
#import <CommonCrypto/CommonDigest.h>

static UILabel *txtForSizeFitting = nil;

@implementation GlobalTool

+ (CGSize)sizeFitsWithSize:(CGSize)size text:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self sizeFitsWithSize:size text:text font:[UIFont systemFontOfSize:fontSize]];
}

+ (CGSize)sizeFitsWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font {
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:(text ? text : @"") attributes:@{NSFontAttributeName:font}];
    return [self sizeFitsWithSize:size attributeText:attri];
}

+ (CGSize)sizeFitsWithSize:(CGSize)size attributeText:(NSAttributedString *)attributeText {
    if (txtForSizeFitting == nil) {
        txtForSizeFitting = [UILabel quickLabelWithFont:[UIFont systemFontOfSize:15] textColor:HexColor(@"ffffff") parentView:nil];
    }
    txtForSizeFitting.attributedText = attributeText;
    return [txtForSizeFitting sizeThatFits:size];
}

+ (NSString *)timeStringBy:(NSInteger)unixTimeStamp formatter:(NSString *)formatterStr {
    NSInteger digitsOfIt = [GlobalTool getDigitsOfAnInteger:unixTimeStamp];
    if (digitsOfIt > 10) {
        NSInteger delta = digitsOfIt - 10;
        unixTimeStamp = unixTimeStamp/((NSInteger)(pow(10.0, delta)));
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixTimeStamp];
    
    return [formatter stringFromDate:date];
}

+ (NSInteger)getDigitsOfAnInteger:(NSInteger)integer {
    return integer <= 0 ? 0 : 1 + [GlobalTool getDigitsOfAnInteger:integer/10];
}

+ (NSString *)md5String:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end

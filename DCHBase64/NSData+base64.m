//
//  NSData+base64.m
//  保存到相册
//
//  Created by dolway on 2019/8/27.
//  Copyright © 2019 iss. All rights reserved.
//

#import "NSData+base64.h"


@interface NSString (Base64)

- (NSString *) stringPaddedForBase64;

@end

@implementation NSString (Base64)

- (NSString *) stringPaddedForBase64 {
    NSUInteger paddedLength = self.length + (self.length % 3);
    return [self stringByPaddingToLength:paddedLength withString:@"=" startingAtIndex:0];
}

@end



@implementation NSData (base64)


- (instancetype) initWithBase64EncodedString:(NSString *)base64String {
    return [self initWithBase64EncodedString:[base64String stringPaddedForBase64] options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    return [self initWithBase64Encoding:[base64String stringPaddedForBase64]];
}

- (NSString *) base64EncodedString {
    return[self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    return [self base64Encoding];
}

@end

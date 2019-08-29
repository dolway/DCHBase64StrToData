//
//  NSData+base64.h
//  保存到相册
//
//  Created by dolway on 2019/8/27.
//  Copyright © 2019 iss. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (base64)
/**
 Returns a data object initialized with the given Base-64 encoded string.
 @param base64String A Base-64 encoded NSString
 @returns A data object built by Base-64 decoding the provided string. Returns nil if the data object could not be decoded.
 */
- (instancetype) initWithBase64EncodedString:(NSString *)base64String;

/**
 Create a Base-64 encoded NSString from the receiver's contents
 @returns A Base-64 encoded NSString
 */
- (NSString *) base64EncodedString;
@end

NS_ASSUME_NONNULL_END
